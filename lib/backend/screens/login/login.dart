import 'package:carenet/backend/responsive.dart';
import 'package:carenet/backend/screens/components/background.dart';
import 'package:carenet/backend/screens/login/components/login_form.dart';
import 'package:carenet/backend/screens/login/components/login_top_image.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Widget toPass;
  const LoginScreen({super.key, required this.toPass});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(
            toPass: toPass,
          ),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(
                        toPass: toPass,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  final Widget toPass;
  const MobileLoginScreen({super.key, required this.toPass});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(
                toPass: toPass,
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
