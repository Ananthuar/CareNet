import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

loginActivity(emailAddress, password, ctx, Widget passit) async {
  String printOutput = '';

  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);

    // Check if the user's email is verified
    if (credential.user!.emailVerified) {
      printOutput = 'Welcome Again...';
      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (context) => passit));
    } else {
      printOutput = 'Please verify your email before logging in.';
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      printOutput = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      printOutput = 'Wrong password provided for that user.';
    } else {
      printOutput = 'Check entered details, internet connection and try again.';
    }
  }

  final snackBar = SnackBar(
    backgroundColor: const Color.fromARGB(255, 254, 172, 209),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10), right: Radius.circular(10)),
        side: BorderSide(color: Color.fromARGB(255, 143, 194, 253))),
    content: Text(printOutput),
  );
  ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
}
