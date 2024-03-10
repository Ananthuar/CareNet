import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

//Uploading profile picture
Future<String> uploadRequestPhoto(File imageFile) async {
  String fileName = basename(imageFile.path);
  Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('request_uploads/$fileName');
  UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}

//uploading user data
Future<void> uploadUserData(
    String email,
    String fullName,
    String dob,
    String dateReq,
    String occupation,
    String loc,
    String description,
    String photoUrl) async {
  CollectionReference userRequest =
      FirebaseFirestore.instance.collection('userRequest');
  await userRequest.add({
    'email': email,
    'full_name': fullName,
    'date_of_birth': dob,
    'request_date': dateReq,
    'occupation': occupation,
    'location': loc,
    'problem_description': description,
    'profile_photo': photoUrl,
  });
}

//Collecting data for upload
void collectRequest(ctx, requestImage, fullName, dOb, dateTime, occupation1,
    location1, problemDes) async {
  File imageFile = requestImage;
  String? email = await getUserEmail(ctx);
  String fullname = fullName;
  String dob = dOb;
  String reqDate = dateTime;
  String occupation = occupation1;
  String nationality = location1;
  String desProblem = problemDes;

  String photoUrl = await uploadRequestPhoto(imageFile);
  await uploadUserData(email!, fullname, dob, reqDate, occupation, nationality,
      desProblem, photoUrl);
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
