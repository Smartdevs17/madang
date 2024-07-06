import 'package:flutter/material.dart';
import 'package:madang/routes/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(
        child: Text(
          'Your content here',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        activeIndex: 3,
      ),
    );
  }
}
