import 'package:flutter/material.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: ListView(
        children: const <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Policies',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ExpansionTile(
            title: Text('Privacy Policy'),
            children: <Widget>[
              Text(
                'We collect personal data such as your name, email address, and donation history to provide a personalized experience. We do not share your data with third parties and use secure protocols to protect your data.\n',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Terms Of Services'),
            children: <Widget>[
              Text(
                'By using our app, you agree to these terms. You are responsible for any activity on your account and you must keep your account password secure. We may suspend or terminate your account if you violate our terms.\n',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Donation Policy'),
            children: <Widget>[
              Text(
                'When you make a donation, the funds are transferred directly to the chosen charity. All donations are final and non-refundable.\n',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Content Policy'),
            children: <Widget>[
              Text(
                'We do not allow hate speech, harassment, or illegal activities. Violations of this policy may result in content removal and/or account suspension.\n',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Verification Policy'),
            children: <Widget>[
              Text(
                'We verify charities by checking their registration status with the local government and reviewing their public financial statements.\n',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Security Policy'),
            children: <Widget>[
              Text(
                'We use encryption to protect your personal data and perform regular security audits to ensure the integrity of our system.\n',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
