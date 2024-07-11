import 'package:flutter/material.dart';
import 'package:madang/features/cart/presentation/cart_item.dart';
import 'package:madang/utils/theme/theme.dart';

class CartItemWidget extends StatefulWidget {
  final String productId;
  final CartItem cartItem;

  CartItemWidget({
    required this.productId,
    required this.cartItem,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
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
            // Name and Price Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.cartItem.title,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\#${widget.cartItem.price}',
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
                      if (widget.cartItem.quantity > 1) {
                        widget.cartItem.quantity--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove_circle),
                ),
                Text('${widget.cartItem.quantity}'), // Quantity text
                IconButton(
                  color: mainColor,
                  onPressed: () {
                    // Increase quantity logic
                    setState(() {
                      widget.cartItem.quantity++;
                    });
                  },
                  icon: const Icon(Icons.add_circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
