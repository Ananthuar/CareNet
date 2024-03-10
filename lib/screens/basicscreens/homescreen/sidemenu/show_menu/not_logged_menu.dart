import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/contactscreen.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/org_registration_screen/org_registration.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/policiesscreen/policiesscreen.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/share_screen/sharescreen.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/userprofile.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/volunteership_screen/volunteership.dart';
import 'package:flutter/material.dart';

class NotLoggedMenu extends StatelessWidget {
  void _showBottomSheet(BuildContext context, Widget screen) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return screen;
      },
    );
  }

  const NotLoggedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Care Net',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            accountEmail: Text(
              'carenet@gmail.com',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(image: AssetImage('assets/images/logo.png')),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Profile_Background.png')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
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
}
