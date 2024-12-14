import 'package:flutter/material.dart';
import 'package:madang/features/recent/model/order_model.dart';
import 'package:madang/utils/theme/theme.dart';

class TableDetails extends StatelessWidget {
  final TableOrder table;
  final VoidCallback onRemove;

  const TableDetails({
    Key? key,
    required this.table,
    required this.onRemove,
  }) : super(key: key);

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(table.table?.image ??
                    'https://example.com/default.png'), // Replace with your image path or network image
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          // Name and Description Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  table.table?.name ?? '',
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${table.table?.number} table ${table.table?.capacity} chairs",
                  style: const TextStyle(
                    color: primaryColorDK,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
