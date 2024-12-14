import 'package:flutter/material.dart';
import 'package:madang/features/recent/presentation/order_list.dart';
import 'package:madang/utils/theme/theme.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
                  fontSize: 24,
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
    );
  }
}
