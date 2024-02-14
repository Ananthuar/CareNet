import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Center(
            child:Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            )
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Image.asset(
            'assets/images/contactus2.png',
            height: 250,
          )),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Have an issue or query? \n Feel free to contact us',
            style: TextStyle(fontSize: 22.0, color: Colors.grey[800]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.alternate_email,
                          color: Colors.orange, size: 50),
                      Text(
                        'Write to us:',
                        style: TextStyle(color: Colors.orange),
                      ),
                      Text('help@gmail.com')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.call, color: Colors.orange, size: 50),
                      Text('Call us:', style: TextStyle(color: Colors.orange)),
                      Text('+91 1234 5678 90')
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.help_outline, color: Colors.orange, size: 50),
                      Text('FAQs', style: TextStyle(color: Colors.orange)),
                      Text('Frequently Asked Questions',
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.orange, size: 50),
                      Text('Locate us:',
                          style: TextStyle(color: Colors.orange)),
                      Text(
                        'Find us out on Google Maps',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(child: Text('Copyright (c) Care Net')),
          const Center(child: Text('Developed by Care Net')),
          const SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}