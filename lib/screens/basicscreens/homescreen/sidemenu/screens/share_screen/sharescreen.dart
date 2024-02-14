import 'package:flutter/material.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child:  SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child:Text(
                'Share App',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
              )
            ),
            const SizedBox(
              height: 20,
            ),
            Transform.translate(
              offset: const Offset(0, 35),
              child: const Text(
                'Did you think that this app is useful?\nShare Now... ✨',
                style: TextStyle(
                  fontSize: 17
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Transform.translate(
              offset: const Offset(2, 65),
              child: const Text(
                'Just share the app and do nothing more....\n\nIt may help a lot of people who waiting for a helping hand \nwhich lending towards him and also bring helping hands \nto needed ones..!' ,
                style: TextStyle(
                  fontSize: 12
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 100),
              child:  ElevatedButton(
                onPressed: () {
                  
                },
                child: const Text(
                  'Share App'
                )
              )
            ),
          ],
        ), 
      ),
    );
  }
}