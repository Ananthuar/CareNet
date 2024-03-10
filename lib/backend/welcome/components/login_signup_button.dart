import 'package:carenet/backend/constants/constants.dart';
import 'package:carenet/backend/screens/login/login.dart';
import 'package:carenet/backend/screens/signup/signup.dart';
import 'package:flutter/material.dart';

class LoginAndSignupBtn extends StatelessWidget {
  final Widget pass;
  const LoginAndSignupBtn({
    super.key,
    required this.pass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen(toPass: pass);
                },
              ),
            );
          },
          child: Text(
            "Login".toUpperCase(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen(
                    toPass: pass,
                  );
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryLightColor,
            elevation: 0,
          ),
          child: Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
