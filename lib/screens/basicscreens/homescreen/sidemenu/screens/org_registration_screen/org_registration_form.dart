import 'dart:io';

import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/org_registration_screen/reset_org_fields.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/org_registration_screen/upload_org.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class OrganisationRegistrationForm extends StatefulWidget {
  const OrganisationRegistrationForm({super.key});

  @override
  State<OrganisationRegistrationForm> createState() =>
      _OrganisationRegistrationFormState();
}

class _OrganisationRegistrationFormState
    extends State<OrganisationRegistrationForm> {
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

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _typeController = TextEditingController();

  final TextEditingController _dorController = TextEditingController();

  final TextEditingController _uniqueIdController = TextEditingController();

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
            'Register Your Organisation By Filling Details.',
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
                    labelText: 'Title Of Organisation',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),
                controller: _titleController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Registered Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                controller: _dorController,
                onTap: () async {
                  final pickedDate = await presentDatePicker(context);
                  if (pickedDate != null) {
                    // Update the text field with the selected date
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    // Update the text field with the formatted date
                    _dorController.text = formattedDate;
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
                labelText: 'Type Of NGO',
                prefixIcon: Icon(Icons.help),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                )),
            controller: _typeController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "NGO Darpan Unique ID",
              prefixIcon: Icon(Icons.numbers_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            controller: _uniqueIdController,
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
              labelText: "Contact Details",
              prefixIcon: Icon(Icons.phone),
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
                    resetOrganisationFields(
                        _titleController,
                        _dorController,
                        _typeController,
                        _uniqueIdController,
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
                    if (_titleController.text.isEmpty ||
                        _dorController.text.isEmpty ||
                        _typeController.text.isEmpty ||
                        _uniqueIdController.text.isEmpty ||
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
                      String orgTitle = _titleController.text;
                      String dOr = _dorController.text.toString();
                      String orgType = _typeController.text;
                      String uniqueID = _uniqueIdController.text;
                      String location = _locationController.text;
                      String contact = _contactController.text;
                      File orgImage = File(_image!.path);
                      collectOrganisationDetails(context, orgImage, orgTitle,
                          dOr, dateTime, orgType, uniqueID, location, contact);
                      resetOrganisationFields(
                          _titleController,
                          _dorController,
                          _typeController,
                          _uniqueIdController,
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
