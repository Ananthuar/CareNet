import 'package:carenet/screens/basicscreens/explorescreen/actions/organisationactionselection.dart';
import 'package:flutter/material.dart';

class OrganisationScreen extends StatelessWidget {
  const OrganisationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(5, 20),
                  child: InkWell(
                    onTap: () {
                      var stryUrl = 'https://www.atmafoundation.org';
                      actionSelection(context, stryUrl, 'Atma Foundations',
                          'Atma Foundations');
                    },
                    child: Container(
                      height: 330,
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 10),
                            child: const Text(
                              'Atma Foundation',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Transform.translate(
                              offset: const Offset(0, 20),
                              child: Image.network(
                                  'https://www.atmafoundation.org/assets/img/gallery/relief5.jpg')),
                          Transform.translate(
                            offset: const Offset(0, 30),
                            child: const Text(
                              'Lets lend a helping hand to this foundation which works for welfare of society with the aim of helping needed ones..!',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(5, 25),
                  child: InkWell(
                    onTap: () {
                      var stryUrl =
                          'https://www.yogaiya.in/sri-sathyam-foundation-charitable-trust//';
                      actionSelection(
                          context,
                          stryUrl,
                          'Sri Sathyam Foundation',
                          'Sri Sathyam Foundation Charitable Trust.');
                    },
                    child: Container(
                      height: 360,
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 10),
                            child: const Text(
                              'Sri Sathyam Foundation Charitable Trust.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Transform.translate(
                              offset: const Offset(0, 20),
                              child: Image.network(
                                  'https://www.yogaiya.in/wp-content/uploads/2021/03/SRI-SATHYAM-FOUNDATION-CHARITABLE-TRUST.jpg')),
                          Transform.translate(
                            offset: const Offset(0, 30),
                            child: const Text(
                              'A little helping hand means big to those who like this organisation someone willing to help others..!',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(5, 30),
                  child: InkWell(
                    onTap: () {
                      var stryUrl = 'https://ammakuyiloldagehome.com';
                      actionSelection(
                          context,
                          stryUrl,
                          'Amma Kuyil Charitable Trust',
                          'Amma Kuyil Charitable Trust');
                    },
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2.0)),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 10),
                            child: const Text(
                              'Amma Kuyil Charitable Trust.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Transform.translate(
                              offset: const Offset(0, 20),
                              child: Image.network(
                                  'https://th.bing.com/th/id/OIP.TSTq_oZ6tEmDohmKACNNswHaE8?rs=1&pid=ImgDetMain')),
                          Transform.translate(
                            offset: const Offset(0, 30),
                            child: const Text(
                              'Can you see?, some eyes are looking to you for a helpnig hand..!',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 50,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
