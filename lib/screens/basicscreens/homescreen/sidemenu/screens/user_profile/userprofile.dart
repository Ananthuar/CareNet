import 'package:carenet/backend/welcome/welcome.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/View_Profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            return const ProfileManager();
          } else {
            return  const WelcomePage(toPass: ProfileManager(),); 
          }
        }
      },
    );
  }
}
