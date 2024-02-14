import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileManager extends StatefulWidget {
  const ProfileManager({super.key});

  @override
  _ProfileManagerState createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  String _name = '';
  String _username = '';
  String _contact = '';
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _pickImage,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onSaved: (value) => _name = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
              onSaved: (value) => _username = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Contact Details'),
              onSaved: (value) => _contact = value!,
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
