import 'package:carenet/backend/welcome/welcome.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/edit_profile.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/view_profile/profile_viewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<User?>? _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = FirebaseAuth.instance.authStateChanges().first;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('userProfile')
                .where('email', isEqualTo: snapshot.data!.email)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return const ProfileViewer();
              } else {
                return const ProfileManager();
              }
            },
          );
        } else {
          return const WelcomePage(
            toPass: ProfileManager(),
          );
        }
      },
    );
  }
}
