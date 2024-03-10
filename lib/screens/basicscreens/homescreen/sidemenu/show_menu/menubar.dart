import 'package:carenet/screens/basicscreens/homescreen/sidemenu/show_menu/logged_menu.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/show_menu/not_logged_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeMenuBar extends StatefulWidget {
  const HomeMenuBar({super.key});

  @override
  State<HomeMenuBar> createState() => _HomeMenuBarState();
}

class _HomeMenuBarState extends State<HomeMenuBar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // User is logged in
          return LoggedMenu(); // Navigate to home screen
        } else {
          // User is not logged in
          return const NotLoggedMenu(); // Navigate to login screen
        }
      },
    );
  }
}
