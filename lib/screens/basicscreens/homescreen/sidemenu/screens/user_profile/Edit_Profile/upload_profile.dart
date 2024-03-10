import 'dart:io';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/view_profile/profile_viewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

//Uploading profile picture
Future<String> uploadProfilePhoto(File imageFile) async {
  String fileName = basename(imageFile.path);
  Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('uploads/$fileName');
  UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  return downloadUrl;
}

//uploading user data
Future<void> uploadUserData(ctx, String email, String fullName, String dob,
    String occupation, String nationality, String photoUrl) async {
  CollectionReference userProfile =
      FirebaseFirestore.instance.collection('userProfile');
  await userProfile
      .add({
        'email': email,
        'full_name': fullName,
        'date_of_birth': dob,
        'occupation': occupation,
        'nationality': nationality,
        'profile_photo': photoUrl,
      })
      .then((value) => {
            Navigator.of(ctx).push(MaterialPageRoute(
                builder: ((context) => const ProfileViewer())))
          })
      .catchError((error) {
        final snackbar = SnackBar(
          content: Text('$error'),
          backgroundColor: const Color.fromARGB(255, 251, 161, 242),
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
      });
}

//Collecting data for upload
void uploadProfile(
    ctx, profileImage, fullName, dOb, occupation1, nationality1) async {
  File imageFile = profileImage;
  String? email = await getUserEmail(ctx);
  String fullname = fullName;
  String dob = dOb;
  String occupation = occupation1;
  String nationality = nationality1;

  String photoUrl = await uploadProfilePhoto(imageFile);
  await uploadUserData(
      ctx, email!, fullname, dob, occupation, nationality, photoUrl);
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
