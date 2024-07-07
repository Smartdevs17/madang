import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text('Privacy Policy',
            style: TextStyle(color: primaryColorDK)),
        iconTheme: const IconThemeData(color: primaryColorDK),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This is where your privacy policy content will go. '
                'You can copy your privacy policy text here or fetch it from a server.',
                style: TextStyle(fontSize: 16),
              ),
              // Add more content as needed
            ],
          ),
        ),
      ),
    );
  }
}
