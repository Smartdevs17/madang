import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class HelpAndReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text('Help & Report',
            style: TextStyle(color: primaryColorDK)),
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
              'Help & Report',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.help, color: primaryColorDK),
              title: const Text('Help Center'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle Help Center tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.report_problem, color: primaryColorDK),
              title: const Text('Report a Problem'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle Report a Problem tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_support, color: primaryColorDK),
              title: const Text('Contact Support'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle Contact Support tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
