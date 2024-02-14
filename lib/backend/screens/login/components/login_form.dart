import 'package:carenet/backend/constants/constants.dart';
import 'package:carenet/backend/screens/components/have_account.dart';
import 'package:carenet/backend/screens/login/activities/loginactivity.dart';
import 'package:carenet/backend/screens/signup/signup.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  final Widget toPass;
  LoginForm({
    super.key,
    required this.toPass
  });

  String email='';

  String password='';

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              email=emailController.text;
              password=passwordController.text;
              loginActivity(email, password, context,toPass);
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen(toPass: toPass,);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}