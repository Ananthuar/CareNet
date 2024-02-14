
import 'package:carenet/backend/welcome/welcome.dart';
import 'package:carenet/screens/basicscreens/donationscreen/checkdonations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            return const CheckDonations();
          } else {
            return const WelcomePage(toPass: CheckDonations(),); 
          }
        }
      },
    );
  }
}