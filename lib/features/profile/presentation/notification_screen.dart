import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title:
            const Text('Notification', style: TextStyle(color: primaryColorDK)),
        iconTheme: const IconThemeData(color: primaryColorDK),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Receive Notifications'),
              value: true,
              onChanged: (bool value) {
                // Handle Receive Notifications toggle
              },
              activeColor: primaryColorDK,
            ),
            SwitchListTile(
              title: const Text('Receive Offers'),
              value: false,
              onChanged: (bool value) {
                // Handle Receive Offers toggle
              },
              activeColor: primaryColorDK,
            ),
            SwitchListTile(
              title: const Text('Receive Updates'),
              value: true,
              onChanged: (bool value) {
                // Handle Receive Updates toggle
              },
              activeColor: primaryColorDK,
            ),
          ],
        ),
      ),
    );
  }
}
