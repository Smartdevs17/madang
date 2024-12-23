import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madang/features/food/presentation/food_item.dart';
import 'package:madang/features/recent/model/order_model.dart';
import 'package:madang/features/recent/widgets/food_details.dart';
import 'package:madang/features/recent/widgets/table_details.dart';
import 'package:madang/features/table/presentation/table_item.dart';
import 'package:madang/utils/action/format_price.dart';
import 'package:madang/utils/theme/theme.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel order;

  const OrderDetailScreen({super.key, required this.order});

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
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        backgroundColor: primaryColorLT,
        title: const Text(
          "Order Details",
          style: TextStyle(
            fontSize: 24,
            color: primaryColorDK,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1,
        shadowColor: primaryColorLT,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Date: ${_getMonthName(order.createdAt?.month)} ${order.createdAt?.day}, ${order.createdAt?.year} ${_formatTime(order.createdAt)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColorDK,
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionHeader("Foods"),
              const SizedBox(height: 8),
              // Check for null or empty food orders
              if (order.foodOrders?.isNotEmpty ?? false)
                ...order.foodOrders!.map((food) => Column(
                      children: [
                        FoodDetails(
                          food: food,
                          quantity: food.quantity ?? 0,
                          isReadOnly: true,
                          onQuantityChanged: (quantity) {},
                          onRemove: () {},
                        ),
                        const SizedBox(height: 16),
                      ],
                    )),
              const SizedBox(height: 16),
              _buildSectionHeader("Tables"),
              const SizedBox(height: 8),
              // Check for null or empty table orders
              if (order.tableOrders?.isNotEmpty ?? false)
                ...order.tableOrders!.map((table) => TableDetails(
                      table: table,
                      onRemove: () {},
                    )),
              const SizedBox(height: 16),
              _buildSectionHeader("Summary"),
              const SizedBox(height: 8),
              // Summary Rows
              _buildSummaryRow(
                  "Food Total",
                  order.foodOrders?.isNotEmpty ?? false
                      ? order.foodOrders!
                          .map((food) =>
                              (food.food?.price ?? 0) * (food.quantity ?? 1))
                          .reduce((a, b) => a + b)
                      : 0),
              _buildSummaryRow(
                "Table Total",
                (order.tableOrders?.isNotEmpty ?? false)
                    ? order.tableOrders!
                        .map((table) => table.table?.price ?? 0)
                        .reduce((a, b) => a + b)
                    : 0,
              ),
              const SizedBox(height: 10),
              Text(
                "Grand Total: ${formatPrice(order.totalPrice)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: primaryColorDK,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColorDK,
      ),
    );
  }

  Widget _buildSummaryRow(String label, num? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: primaryColorDK,
          ),
        ),
        Text(
          formatPrice(value ?? 0),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: primaryColorDK,
          ),
        ),
      ],
    );
  }
}
