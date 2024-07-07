import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class MyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(color: primaryColorDK)),
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
              'Cart Items',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Replace with actual item count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.fastfood, color: primaryColorDK),
                    title: Text('Cart Item ${index + 1}'),
                    subtitle: Text('Description of item ${index + 1}'),
                    trailing: Text('\$${(index + 1) * 10}'),
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
