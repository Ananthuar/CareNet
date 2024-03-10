import 'package:carenet/backend/responsive.dart';
import 'package:carenet/backend/screens/components/background.dart';
import 'package:carenet/backend/welcome/components/login_signup_button.dart';
import 'package:carenet/backend/welcome/components/welcome_image.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final Widget toPass;
  const WelcomePage({
    super.key,
    required this.toPass,
  });

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(
                          pass: toPass,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: MobileWelcomeScreen(
              toPass: toPass,
            ),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  final Widget toPass;
  const MobileWelcomeScreen({super.key, required this.toPass});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(pass: toPass),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
