import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class TableItem extends StatefulWidget {
  const TableItem({
    super.key,
  });

  @override
  State<TableItem> createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: <Widget>[
          // Image
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/images/food1.png'), // Replace with your image path or network image
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          // Name and Price Column
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Work Table',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1 table 1 chair',
                  style: TextStyle(color: primaryColorDK, fontSize: 16),
                ),
              ],
            ),
          ),
          IconButton(
            color: neutralGrey,
            onPressed: () {
              // Remove item logic
            },
            icon: const Icon(Icons.restore_from_trash),
          ),
        ],
      ),
    );
  }
}
