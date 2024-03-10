import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/org_registration_screen/org_registration_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrganisationRegistration extends StatelessWidget {
  OrganisationRegistration({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;

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
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Trying to strengthen weaker ones..?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 340,
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "\nTrying to hold hands of needed ones...?\nCan't stand alone for them..?\nNot enough strength..?\nMany helping hands are ready to strengthen you and hence the needed ones..!\n\n\nAre you running a organisation that perform charity activities..?\nDo you think your organisation haven't enough financial or physical strength to fullfill your dream..?\nDon't worry...\nCare Net is always here for you..!",
                        textAlign: TextAlign.start,
                      ),
                      const Text(
                        "\n\n\nRegister your Organisation..\n\n\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(alignment: Alignment.center),
                        onPressed: () {
                          if (auth.currentUser != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const OrganisationRegistrationForm()));
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
                        child: const Text('Organisation Registration'),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
