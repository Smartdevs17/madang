import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madang/utils/theme/theme.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    Placeholder(color: Colors.blue),
    Placeholder(color: Colors.green),
    Placeholder(color: Colors.orange),
    Placeholder(color: Colors.red),
  ];

  static List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/home.svg'),
      activeIcon: SvgPicture.asset('assets/svgs/home.svg', color: mainColor),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/search.svg'),
      activeIcon: SvgPicture.asset('assets/svgs/search.svg', color: mainColor),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/refresh-circle.svg'),
      activeIcon:
          SvgPicture.asset('assets/svgs/refresh-circle.svg', color: mainColor),
      label: 'Recent',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/person.svg'),
      activeIcon: SvgPicture.asset('assets/svgs/person.svg', color: mainColor),
      label: 'Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _navBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor, // Selected item text and icon color
        onTap: _onItemTapped,
      ),
    );
  }
}
