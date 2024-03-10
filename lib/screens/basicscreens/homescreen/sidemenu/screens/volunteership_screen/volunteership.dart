import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/volunteership_screen/volunteer_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VolunteershipScreen extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  VolunteershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Are you ready to help physically...?',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Center(
                      child: SizedBox(
                        width: 335,
                        child: Column(
                          children: [
                            Text(
                              "Have a thirst to help the needed ones? ",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Not having the ability to support them financially? "),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Register yourself with needed details over here. "),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Do you know someone who ready for voluntarily works for the needed ones at needed time? "),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Can't help them alone? "),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Don't worry... Care Net is here for you. "),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Add them as volunteers..!"),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Be a volunteer..',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (auth.currentUser != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const VolunteershipForm()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Sign In And Try Again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor:
                                  const Color.fromARGB(255, 254, 181, 248),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: const Text('Register as volunteer'),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
