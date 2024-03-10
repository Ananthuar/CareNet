import 'dart:io';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/Edit_Profile/date_picker.dart';
import 'package:carenet/screens/basicscreens/requestscreen/reset_request_fields.dart';
import 'package:carenet/screens/basicscreens/requestscreen/upload_request.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
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

  final TextEditingController _problemController = TextEditingController();

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
            height: 20,
          ),
          const Center(
              child: Text(
            'Share Problem',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          )),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Full Name Of Help Seeker',
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
                    _dobController.text = pickedDate.toString();
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
              labelText: 'Describe about your problem.',
              prefixIcon: Icon(Icons.help),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            controller: _problemController,
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
                    resetRequestFields(
                        _nameController,
                        _dobController,
                        _occupationController,
                        _locationController,
                        _problemController);
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
                        _locationController.text.isEmpty ||
                        _problemController.text.isEmpty ||
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
                      String location = _locationController.text;
                      String problem = _problemController.text;
                      File reqImage = File(_image!.path);
                      collectRequest(context, reqImage, fullName, dOb, dateTime,
                          occupation, location, problem);
                      resetRequestFields(
                          _nameController,
                          _dobController,
                          _occupationController,
                          _locationController,
                          _problemController);
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
