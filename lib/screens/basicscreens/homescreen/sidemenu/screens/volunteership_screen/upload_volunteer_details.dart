import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

//Uploading profile picture
Future<String> uploadVolunteerPhoto(File imageFile) async {
  String fileName = basename(imageFile.path);
  Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('volunteer_uploads/$fileName');
  UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}

//uploading user data
Future<void> uploadVolunteerData(
    String email,
    String fullName,
    String dob,
    String dateReq,
    String occupation,
    String aadhar,
    String loc,
    String contact,
    String photoUrl) async {
  CollectionReference volunteerRegistration =
      FirebaseFirestore.instance.collection('volunteerRegistration');
  await volunteerRegistration.add({
    'email': email,
    'full_name': fullName,
    'date_of_birth': dob,
    'registration_date': dateReq,
    'occupation': occupation,
    'aadhar_number': aadhar,
    'location': loc,
    'contact_details': contact,
    'profile_photo': photoUrl,
  });
}

//Collecting data for upload
void collectVolunteerDetails(ctx, requestImage, fullName, dOb, dateTime,
    occupation1, aadhar, location1, contact) async {
  File imageFile = requestImage;
  String? email = await getUserEmail(ctx);
  String fullname = fullName;
  String dob = dOb;
  String regDate = dateTime;
  String occupation = occupation1;
  String volAadhar = aadhar;
  String location = location1;
  String volContact = contact;

  String photoUrl = await uploadVolunteerPhoto(imageFile);
  await uploadVolunteerData(email!, fullname, dob, regDate, occupation,
      volAadhar, location, volContact, photoUrl);
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
