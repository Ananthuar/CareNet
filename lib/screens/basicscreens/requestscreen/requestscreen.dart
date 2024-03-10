import 'package:carenet/screens/basicscreens/homescreen/sidemenu/screens/volunteership_screen/volunteership.dart';
import 'package:carenet/screens/basicscreens/requestscreen/request_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestScreen extends StatelessWidget {
  RequestScreen({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    void showBottomSheet(BuildContext context, Widget screen) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return screen;
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 340,
            height: 680,
            decoration: BoxDecoration(
                color: const Color.fromARGB(235, 232, 232, 232),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    'Here, the hands will lend for you..💕',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 335,
                        child: Text(
                            "   Searching for a helping hand..? \n  Much helping  hands are ready to lend for you\n  at  anytime  anywhere..! \n  Make requests here if you need a help... \n\n\n  Can you see people who looking for a helping \n  hand..? \n  Can't help them alone...? \n  Don't worry... Care Net is here for you... \n  Rise requests for them..!"),
                      ),
                      const SizedBox(
                        width: 330,
                        child: Center(
                          child: Text(
                            '\n\n\nRise a request..\n\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (auth.currentUser != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RequestForm()));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Sign In And Try Again",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: const Color.fromARGB(
                                          255, 253, 170, 253),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                              child: const Text('Self Request')),
                          ElevatedButton(
                              onPressed: () {
                                if (auth.currentUser != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RequestForm()));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Sign In And Try Again",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: const Color.fromARGB(
                                          255, 253, 170, 253),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              },
                              child: const Text('Request for others')),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                              "Can't help financially..? Like to help others..?")),
                      const Text("Help physically...!"),
                      const Text("Join as a volunteer now..!✨"),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: ElevatedButton(
                            onPressed: () {
                              showBottomSheet(context, VolunteershipScreen());
                            },
                            child: const Text('Register As Volunteer')),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
