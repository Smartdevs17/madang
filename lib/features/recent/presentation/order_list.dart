import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/recent/controller/order_controller.dart';
import 'package:madang/features/recent/presentation/order_detail.dart';
import 'package:madang/utils/theme/theme.dart';

class OrderListView extends StatelessWidget {
  final bool isNewest;
  final OrderController _orderController = Get.find<OrderController>();

  OrderListView({required this.isNewest});

  bool _isCurrentMonth(DateTime? date) {
    if (date == null) return false;
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }

  String _getMonthName(int? month) {
    if (month == null) return '';
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    final hour = dateTime.toLocal().hour;
    final minute = dateTime.toLocal().minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return ' ${hour12.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final allOrders = _orderController.orders;
        final filteredOrders = allOrders.where((order) {
          final isCurrentMonth = _isCurrentMonth(order.createdAt);
          return isNewest ? isCurrentMonth : !isCurrentMonth;
        }).toList()
          ..sort((a, b) =>
              b.createdAt!.compareTo(a.createdAt!)); // Sort by most recent

        return ListView.builder(
          itemCount: filteredOrders.length,
          itemBuilder: (context, index) {
            final order = filteredOrders[index];
            final firstFood = order.foodOrders?.firstOrNull?.food;
            final firstTable = order.tableOrders?.firstOrNull?.table;

            // Select the appropriate image and title based on order type
            final displayImage =
                firstFood?.image ?? firstTable?.image ?? 'default_image_path';
            final displayTitle = (order.foodOrders?.length ?? 0) > 1
                ? "Multiple Items"
                : (firstFood?.name ?? firstTable?.name ?? "Unknown");

            return GestureDetector(
              onTap: () {
                Get.to(() => OrderDetailScreen(order: order));
              },
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    width: 60, // Set the desired width
                    height: 60, // Set the desired height
                    child: Image.network(
                      displayImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Handle image loading errors gracefully
                        return Image.network(
                          'https://img.freepik.com/premium-photo/restaurant-marketing-empty-menu-frame-wooden-table-concept-menu-design-wooden-table-setting-restaurant-promotion-visual-marketing-empty-menu-placeholder_864588-60482.jpg?w=1800',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                title: Text(
                  displayTitle,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  '${order.createdAt?.toLocal().day} ${_getMonthName(order.createdAt?.toLocal().month)} ${order.createdAt?.toLocal().year} ${_formatTime(order.createdAt)} · ${(order.foodOrders?.length ?? 0) + (order.tableOrders?.length ?? 0)} items',
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  order.status ?? 'Unknown',
                  style: TextStyle(
                    fontSize: 14,
                    color: order.status == 'Process'
                        ? mainColor
                        : (order.status == 'completed'
                            ? mainColor
                            : Colors.red),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
