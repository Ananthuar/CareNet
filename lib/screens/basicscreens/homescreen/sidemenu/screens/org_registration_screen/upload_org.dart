import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

//Uploading profile picture
Future<String> uploadOrganisationPhoto(File imageFile) async {
  String fileName = basename(imageFile.path);
  Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('organisation_uploads/$fileName');
  UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}

//uploading user data
Future<void> uploadOrganisationData(
    String email,
    String orgTitle,
    String dor,
    String dateReg,
    String type,
    String uniqueID,
    String loc,
    String contact,
    String photoUrl) async {
  CollectionReference organisationRegistration =
      FirebaseFirestore.instance.collection('organisationRegistration');
  await organisationRegistration.add({
    'email': email,
    'organisation_title': orgTitle,
    'date_of_registration': dor,
    'registration_date': dateReg,
    'type': type,
    'uniqueID_number': uniqueID,
    'location': loc,
    'contact_details': contact,
    'organisation_photo': photoUrl,
  });
}

//Collecting data for upload
void collectOrganisationDetails(ctx, orgImage, orgTitle, dOr, dateTime, orgType,
    uniqueID, location1, contact) async {
  File imageFile = orgImage;
  String? email = await getUserEmail(ctx);
  String orgTitle1 = orgTitle;
  String dor = dOr;
  String regDate = dateTime;
  String type = orgType;
  String orguniqueID = uniqueID;
  String location = location1;
  String orgContact = contact;

  String photoUrl = await uploadOrganisationPhoto(imageFile);
  await uploadOrganisationData(email!, orgTitle1, dor, regDate, type,
      orguniqueID, location, orgContact, photoUrl);
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
