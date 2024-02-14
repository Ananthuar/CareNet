import 'package:carenet/backend/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckDonations extends StatelessWidget {
  const CheckDonations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: const Text('Logout'),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // Navigate to the login screen after logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage(toPass: CheckDonations(),)),
              );
            },
          ),
        )
      ),
    );
  }
}
