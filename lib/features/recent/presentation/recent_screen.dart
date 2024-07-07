import 'package:flutter/material.dart';
import 'package:madang/features/recent/presentation/order_list.dart';
import 'package:madang/routes/bottom_nav_bar.dart';
import 'package:madang/utils/theme/theme.dart';

class RecentScreen extends StatefulWidget {
  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recent",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: primaryColorDK,
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: mainColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: mainColor,
                tabs: const [
                  Tab(text: 'Newest'),
                  Tab(text: 'Oldest'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    OrderListView(isNewest: true),
                    OrderListView(isNewest: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(activeIndex: 2),
    );
  }
}
