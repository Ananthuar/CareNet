import 'package:carenet/firebase_options.dart';
import 'package:carenet/screens/splashscreen/splashscreen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.playIntegrity);

  runApp(const CareNet());
}

class CareNet extends StatelessWidget {
  const CareNet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Net',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
