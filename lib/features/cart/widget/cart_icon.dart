import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/cart/controller/cart_controller.dart';
import 'package:madang/routes/routes.dart';

class CartIcon extends StatelessWidget {
  final CartController _cartController = Get.find();

  CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.cart);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Icon(
            Icons.shopping_cart,
            color: Colors.grey,
          ),
          Obx(() {
            if (_cartController.cartItems.isNotEmpty) {
              return Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    _cartController.cartItems.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
