import 'dart:io';

import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/date_picker.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/volunteership_screen/reset_volunteer_fileds.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/volunteership_screen/upload_volunteer_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class VolunteershipForm extends StatefulWidget {
  const VolunteershipForm({super.key});

  @override
  State<VolunteershipForm> createState() => _VolunteershipFormState();
}

class _VolunteershipFormState extends State<VolunteershipForm> {
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  void _resetImage() {
    setState(() {
      _image = null;
    });
  }

  Future<void> _pickImage() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = selectedImage;
    });
  }

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _occupationController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();

  final TextEditingController _aadharController = TextEditingController();

  final TextEditingController _contactController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            'Register As Volunteer By Filling Details.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Full Name Of Volunteer',
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
              labelText: "Volunteer's Aadhar Number",
              prefixIcon: Icon(Icons.help),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            controller: _aadharController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Location',
              prefixIcon: Icon(Icons.location_on_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            controller: _locationController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: null,
            decoration: const InputDecoration(
              labelText: "Volunteer's Contact Details",
              prefixIcon: Icon(Icons.help),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            controller: _contactController,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.image),
                      _image != null
                          ? Image.file(File(_image!.path))
                          : const Text('    Upload An Image'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    resetVolunteerFields(
                        _nameController,
                        _dobController,
                        _occupationController,
                        _aadharController,
                        _locationController,
                        _contactController);
                    _resetImage();
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
                        _aadharController.text.isEmpty ||
                        _locationController.text.isEmpty ||
                        _contactController.text.isEmpty ||
                        _image == null) {
                      const snackBar = SnackBar(
                        backgroundColor: Color.fromARGB(255, 255, 190, 250),
                        content: Text('Fill all details to continue...'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      String dateTime = DateTime.now().toString();
                      String fullName = _nameController.text;
                      String dOb = _dobController.text.toString();
                      String occupation = _occupationController.text;
                      String aadharNo = _aadharController.text;
                      String location = _locationController.text;
                      String contact = _contactController.text;
                      File reqImage = File(_image!.path);
                      collectVolunteerDetails(context, reqImage, fullName, dOb,
                          dateTime, occupation, aadharNo, location, contact);
                      resetVolunteerFields(
                          _nameController,
                          _dobController,
                          _occupationController,
                          _aadharController,
                          _locationController,
                          _contactController);
                      _resetImage();
                      const snackBar = SnackBar(
                        backgroundColor: Color.fromARGB(255, 255, 190, 250),
                        content: Text(
                            'Details were uploaded successfully..!\nWill published after verification...'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('Submit')),
            ],
          )
        ],
      ))),
    );
  }
}
