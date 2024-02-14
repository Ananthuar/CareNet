import 'package:carenet/backend/constants/constants.dart';
import 'package:carenet/backend/responsive.dart';
import 'package:carenet/backend/screens/components/background.dart';
import 'package:carenet/backend/screens/signup/components/signup_top_image.dart';
import 'package:flutter/material.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  final Widget toPass;
   const SignUpScreen({
    super.key,
    required this.toPass
  });

  @override
  Widget build(BuildContext context) {
    return  Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile:  MobileSignupScreen(toPass: toPass,),
          desktop: Row(
            children: [
              const Expanded(
                child: SignUpScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: SignUpForm(toPass: toPass,),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    // SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  final Widget toPass;
  const MobileSignupScreen({
    super.key,
    required this.toPass
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(toPass: toPass,),
            ),
            const Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}