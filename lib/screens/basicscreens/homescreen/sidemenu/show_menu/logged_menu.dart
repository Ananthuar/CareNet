import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/contactscreen.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/org_registration_screen/org_registration.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/policiesscreen/policiesscreen.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/share_screen/sharescreen.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/userprofile.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/volunteership_screen/volunteership.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedMenu extends StatelessWidget {
  final Future<DocumentSnapshot> _userData;

  LoggedMenu({super.key})
      : _userData = FirebaseFirestore.instance
            .collection('userProfile')
            .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .get()
            .then((querySnapshot) => querySnapshot.docs.first);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _userData,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    data['full_name'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  accountEmail: Text(
                    data['email'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(data['profile_photo']),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/Profile_Background.png'),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('My Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfile()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share'),
                  onTap: () {
                    _showBottomSheet(context, const ShareApp());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.call),
                  title: const Text('Contact Us'),
                  onTap: () {
                    _showBottomSheet(context, const ContactScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('Policies'),
                  onTap: () {
                    _showBottomSheet(context, const PoliciesScreen());
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.volunteer_activism),
                  title: const Text('Volunteership'),
                  onTap: () {
                    _showBottomSheet(context, VolunteershipScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.corporate_fare),
                  title: const Text('Organisation Registration'),
                  onTap: () {
                    _showBottomSheet(context, OrganisationRegistration());
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Exit'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }

        return const CircularProgressIndicator(); // show loading spinner while waiting for data
      },
    );
  }

  void _showBottomSheet(BuildContext context, Widget screen) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return screen;
      },
    );
  }
}
