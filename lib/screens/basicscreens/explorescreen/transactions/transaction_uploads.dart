import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//uploading user data
Future<void> uploadTransactionData(String email, String amountGivenTo,
    String problemTitle, String dot, String tranferedAmount) async {
  CollectionReference transactionDetails =
      FirebaseFirestore.instance.collection('transactionDetails');
  await transactionDetails.add({
    'email': email,
    'seeker_name': amountGivenTo,
    'problem_title': problemTitle,
    'date_of_transaction': dot,
    'tranferred_amount': tranferedAmount,
  });
}

//Collecting data for upload
void collectTransactionDetails(ctx, givenTo, probTitle, amount) async {
  String? email = await getUserEmail(ctx);
  String givenTo1 = givenTo;
  String problemTitle = probTitle;
  String tranfDate = DateTime.now().toString();
  String tranferamount = amount;
  await uploadTransactionData(
      email!, givenTo1, problemTitle, tranfDate, tranferamount);
}

//retrieving email from database
Future<String?> getUserEmail(ctx) async {
  String? email;
  if (FirebaseAuth.instance.currentUser != null) {
    email = FirebaseAuth.instance.currentUser!.email;
  } else {
    const snackbar = SnackBar(
      content: Text("Can't Find A Valid Email.."),
      backgroundColor: Color.fromARGB(255, 251, 161, 242),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
  }
  return email;
}
