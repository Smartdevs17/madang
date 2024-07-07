import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text('Language', style: TextStyle(color: primaryColorDK)),
        iconTheme: IconThemeData(color: primaryColorDK),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Language',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.language, color: primaryColorDK),
              title: const Text('English'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle English selection
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: primaryColorDK),
              title: const Text('Spanish'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle Spanish selection
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: primaryColorDK),
              title: const Text('French'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle French selection
              },
            ),
          ],
        ),
      ),
    );
  }
}
