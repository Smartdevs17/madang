import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class OrderListView extends StatelessWidget {
  final bool isNewest;

  OrderListView({required this.isNewest});

  @override
  Widget build(BuildContext context) {
    // Here you would fetch your data based on the `isNewest` flag
    final List<Map<String, String>> orders =
        isNewest ? getNewestOrders() : getOldestOrders();

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          leading: Image.asset(order['image']!),
          title: Text(
            order['title']!,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text('${order['date']} · ${order['details']}'),
          trailing: Text(
            order['status']!,
            style: TextStyle(
              color: order['status'] == 'Process'
                  ? mainColor
                  : (order['status'] == 'Done' ? mainColor : Colors.red),
            ),
          ),
        );
      },
    );
  }

  List<Map<String, String>> getNewestOrders() {
    // Sample data for the newest orders
    return [
      {
        'image': 'assets/images/recent.png',
        'title': 'Noodle Ex',
        'date': '23 August 2021, 15:32 \n',
        'details': 'Work Table · 1 Flower',
        'status': 'Process'
      },
      // Add more orders here
    ];
  }

  List<Map<String, String>> getOldestOrders() {
    // Sample data for the oldest orders
    return [
      {
        'image': 'assets/images/recent.png',
        'title': 'Noodle Ex',
        'date': '23 August 2021, 15:32\n',
        'details': 'Work Table · 1 Flower',
        'status': 'Done'
      },
      // Add more orders here
      {
        'image': 'assets/images/recent.png',
        'title': 'Noodle Ex',
        'date': '23 August 2021, 15:32\n',
        'details': 'Work Table · 1 Flower',
        'status': 'Cancel'
      },
    ];
  }
}
