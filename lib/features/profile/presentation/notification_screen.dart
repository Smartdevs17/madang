import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification', style: TextStyle(color: primaryColorDK)),
        iconTheme: IconThemeData(color: primaryColorDK),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Receive Notifications'),
              value: true,
              onChanged: (bool value) {
                // Handle Receive Notifications toggle
              },
              activeColor: primaryColorDK,
            ),
            SwitchListTile(
              title: Text('Receive Offers'),
              value: false,
              onChanged: (bool value) {
                // Handle Receive Offers toggle
              },
              activeColor: primaryColorDK,
            ),
            SwitchListTile(
              title: Text('Receive Updates'),
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
