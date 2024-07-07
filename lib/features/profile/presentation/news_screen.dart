import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class NewsAndServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text('News & Services',
            style: TextStyle(color: primaryColorDK)),
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
              'Latest News',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with actual news item count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.new_releases, color: neutralGrey),
                    title: Text('News Item ${index + 1}'),
                    subtitle: Text('Description of news item ${index + 1}'),
                    onTap: () {
                      // Handle news item tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
