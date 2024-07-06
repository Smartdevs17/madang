// import 'package:flutter/material.dart';
// import 'package:writeapp/features/document/presentation/document_screen.dart';
// import 'package:writeapp/features/home/presentation/home_screen.dart';
// import 'package:writeapp/features/settings/presentation/settings_screen.dart';

// class BottomNavScreen extends StatefulWidget {
//   const BottomNavScreen({super.key});

//   @override
//   State<BottomNavScreen> createState() => _BottomNavScreenState();
// }

// class _BottomNavScreenState extends State<BottomNavScreen> {
//   // int _selectedPageIndex = 0;
//   final PageController _pageController = PageController(initialPage: 0);
//   final List<Widget> pages = [
//     HomeScreen(),
//     DocumentScreen(),
//     const SettingsScreen(),
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//       ),
//     );
//   }
// }
