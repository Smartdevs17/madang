import 'package:flutter/material.dart';
import 'package:madang/utils/action/format_price.dart';
import 'package:madang/utils/theme/theme.dart';
import 'package:madang/features/food/model/food_model.dart';

class FoodItem extends StatefulWidget {
  final FoodModel food;
  final int quantity;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove; // Callback for removal
  final bool isReadOnly;

  const FoodItem({
    Key? key,
    required this.food,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove, // Initialize callback
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                image: NetworkImage(widget.food.image ??
                    'https://example.com/default.png'), // Replace with your image path or network image
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          // Name and Price Column
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double fontSize = constraints.maxWidth > 300
                    ? 21
                    : 16; // Adjust font size based on width
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.food.name!,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatPrice(widget.food.price!),
                      style: const TextStyle(
                        color: primaryColorDK,
                        fontSize: 16,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Quantity and Trash Icon
          if (!widget.isReadOnly)
            Row(
              children: [
                IconButton(
                  color: mainColor,
                  onPressed: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                      widget.onQuantityChanged(_quantity);
                    }
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
                Text('$_quantity'), // Quantity text
                IconButton(
                  color: mainColor,
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                    widget.onQuantityChanged(_quantity);
                  },
                  icon: const Icon(Icons.add_circle),
                ),

                IconButton(
                  color: neutralGrey,
                  onPressed: widget.onRemove, // Trigger remove action
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
