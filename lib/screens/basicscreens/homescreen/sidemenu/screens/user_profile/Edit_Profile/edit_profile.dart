import 'dart:io';

import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/date_picker.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/reset_profile_fields.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/upload_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileManager extends StatefulWidget {
  const ProfileManager({super.key});

  @override
  State<ProfileManager> createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _occupationController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();

  final TextEditingController _nationalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                child: ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
            child: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        )),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Stack(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: _imageFile == null
                      ? const Image(image: AssetImage('assets/images/logo.png'))
                      : Image.file(File(_imageFile!.path)),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 247, 242, 246),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          _imageFile = image;
                        });
                      } else {
                        const snackbar = SnackBar(
                          content: Text("No profile picture selected"),
                          backgroundColor: Color.fromARGB(255, 251, 161, 242),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  )),
              controller: _nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Date Of Birth',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              controller: _dobController,
              onTap: () async {
                final pickedDate = await presentDatePicker(context);
                if (pickedDate != null) {
                  // Update the text field with the selected date
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  // Update the text field with the formatted date
                  _dobController.text = formattedDate;
                }
              },
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: const InputDecoration(
              labelText: 'Occupation',
              prefixIcon: Icon(Icons.business_center),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              )),
          controller: _occupationController,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Nationality',
            prefixIcon: Icon(Icons.location_on_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          controller: _nationalityController,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _imageFile = null;
                  });
                  resetProfileFields(_nameController, _dobController,
                      _occupationController, _nationalityController);
                },
                child: const Text('Reset')),
            const SizedBox(
              width: 150,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _dobController.text.isEmpty ||
                      _occupationController.text.isEmpty ||
                      _nationalityController.text.isEmpty ||
                      _imageFile == null) {
                    const snackBar = SnackBar(
                      backgroundColor: Color.fromARGB(255, 255, 190, 250),
                      content: Text('Fill all details to continue...'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    File profImage = File(_imageFile!.path);
                    String fullName = _nameController.text;
                    String dOb = _dobController.text.toString();
                    String occupation = _occupationController.text;
                    String nationality = _nationalityController.text;
                    setState(() {
                      _imageFile = null;
                    });
                    resetProfileFields(_nameController, _dobController,
                        _occupationController, _nationalityController);
                    uploadProfile(context, profImage, fullName, dOb, occupation,
                        nationality);
                  }
                },
                child: const Text('Submit')),
          ],
        )
      ],
    ))));
  }
}
