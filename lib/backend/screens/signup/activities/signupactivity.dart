import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

signUpActivity(emailAddress,password,ctx) async {
  String printOutput='';

  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    
    // Send an email verification to the new user.
    User? user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
    
    printOutput='Account created successfully. A verification email has been sent.';
  }on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      printOutput='The password provided is too weak.';
    }else if (e.code == 'email-already-in-use') {
      printOutput='The account already exists for that email.';
    }
  }catch (e) {
    printOutput=e.toString();
  }

  final snackBar =  SnackBar(
    backgroundColor: const Color.fromARGB(255, 255, 190, 250),
    content: Text(printOutput),
  );
  ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
}
