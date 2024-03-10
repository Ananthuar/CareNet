import 'package:carenet/screens/basicscreens/explorescreen/actions/individualactionselection.dart';
import 'package:flutter/material.dart';

class IndividualScreen extends StatelessWidget {
  const IndividualScreen({super.key});

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
                      var urlstry = 'https://google.com';
                      individualactionSelection(context, urlstry, 'Mehant',
                          'Little Mehanth seeking your help');
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
                              'Little Mehanth seeking your help',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Transform.translate(
                              offset: const Offset(0, 20),
                              child: Image.network(
                                  'https://duet-cdn.vox-cdn.com/thumbor/0x0:3000x2000/750x500/filters:focal(1500x1000:1501x1001):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/15366613/GettyImages-148480508.0.1431565605.jpg')),
                          Transform.translate(
                            offset: const Offset(0, 30),
                            child: const Text(
                              'Little Mehanth and his sister looking for a helping hand which they can get a support from..!',
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
                      var urlstry = 'https://google.com';

                      individualactionSelection(context, urlstry, 'Fathima',
                          'Fathima is fighting.. Help them to be');
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
                              'Fathima is fighting.. Help them to be',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Transform.translate(
                              offset: const Offset(0, 20),
                              child: Image.network(
                                  'https://intpolicydigest.org/wp-content/uploads/2013/10/1911392130399.jpg')),
                          Transform.translate(
                            offset: const Offset(0, 30),
                            child: const Text(
                                'This brave lady, Fathima fighting with fate to hold their family.. Can you help them to fight more powerfully?'),
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
                      var urlstry = 'https://google.com';
                      individualactionSelection(context, urlstry, 'Aasrit',
                          'Aasrith needs your help to make much more moves');
                    },
                    child: Container(
                      height: 380,
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
                              'Aasrith needs your help to make much more moves',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Transform.translate(
                              offset: const Offset(0, 20),
                              child: Image.network(
                                  'https://thumbs.dreamstime.com/b/indian-sick-handicapped-beggar-seeking-help-busy-road-hot-day-january-hyderabad-india-common-scene-india-51331861.jpg')),
                          Transform.translate(
                            offset: const Offset(0, 30),
                            child: const Text(
                              'This little boy used to beg others to escape from hunger..! Can you help him to have a better life?',
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
