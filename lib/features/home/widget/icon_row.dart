import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madang/utils/theme/theme.dart';

class IconRow extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'icon': 'assets/svgs/food.svg',
      'title': 'Food',
    },
    {
      'icon': 'assets/svgs/table.svg',
      'title': 'Table',
    },
    {
      'icon': 'assets/svgs/payment.svg',
      'title': 'Payment',
    },
    {
      'icon': 'assets/svgs/more.svg',
      'title': 'More',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: primaryColorLT,
                child: SvgPicture.asset(
                  item['icon']!,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            const SizedBox(height: 8), // Space between icon and title
            Text(
              item['title']!,
              style: TextStyle(
                color: primaryColorDK,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
