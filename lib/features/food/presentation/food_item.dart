import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({
    super.key,
  });

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  int quantity = 1;

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
                  'Noodle Ex',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Text(
                  '#4500',
                  style: TextStyle(color: primaryColorDK, fontSize: 16),
                ),
              ],
            ),
          ),
          // Quantity
          Row(
            children: [
              IconButton(
                color: mainColor,
                onPressed: () {
                  // Decrease quantity logic
                  setState(() {
                    if (quantity > 1) {
                      quantity--;
                    }
                  });
                },
                icon: const Icon(Icons.remove_circle),
              ),
              Text('$quantity'), // Quantity text
              IconButton(
                color: mainColor,
                onPressed: () {
                  // Increase quantity logic
                  setState(() {
                    quantity++;
                  });
                },
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
