import 'package:carenet/backend/welcome/welcome.dart';
import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/user_profile/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileViewer extends StatefulWidget {
  const ProfileViewer({super.key});

  @override
  State<ProfileViewer> createState() => _ProfileViewerState();
}

class _ProfileViewerState extends State<ProfileViewer> {
  final CollectionReference userProfile =
      FirebaseFirestore.instance.collection('userProfile');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: userProfile.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                          child: Text(
                        'Your Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(data['profile_photo']),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: data['full_name']),
                        decoration: const InputDecoration(
                            labelText: "Full Name",
                            prefixIcon: Icon(Icons.person_2_outlined),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            )),
                        readOnly: true,
                        enableInteractiveSelection: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: data['date_of_birth']),
                        decoration: const InputDecoration(
                          labelText: "Date Of Birth",
                          prefixIcon: Icon(Icons.calendar_month_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        readOnly: true,
                        enableInteractiveSelection: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: data['occupation']),
                        decoration: const InputDecoration(
                            labelText: 'Occupation',
                            prefixIcon: Icon(Icons.business_center),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            )),
                        readOnly: true,
                        enableInteractiveSelection: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: data['nationality']),
                        decoration: const InputDecoration(
                          labelText: 'Nationality',
                          prefixIcon: Icon(Icons.location_on_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        readOnly: true,
                        enableInteractiveSelection: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            // Navigate to the login screen after logout
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomePage(
                                        toPass: UserProfile(),
                                      )),
                            );
                          },
                          child: const Text('Logout'))
                    ],
                  );
                }).toList(),
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
