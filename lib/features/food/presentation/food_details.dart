import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/cart/controller/cart_controller.dart';
import 'package:madang/features/food/model/food_model.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/action/format_price.dart';
import 'package:madang/utils/theme/theme.dart';

Future<void> showFoodDetails(BuildContext context, FoodModel food) async {
  final CartController _cartController = Get.find();

  int quantity = 1;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.5,
            maxChildSize: 0.7,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                      child: Image.network(
                        food.image ?? 'assets/images/Intersect.png',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    food.name ?? '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.visible,
                                    ),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 20),
                                      const SizedBox(width: 4),
                                      Text(
                                        food.averageRating?.toString() ?? 'N/A',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 5.0),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    formatPrice(food.price!),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity > 1) {
                                              quantity--;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.remove_circle),
                                      ),
                                      Text('$quantity'),
                                      IconButton(
                                        color: mainColor,
                                        onPressed: () {
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
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _cartController.addFoodToCart(food, quantity);
                              Get.snackbar('Added to Cart',
                                  '${food.name} has been added to your cart.');
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'Place Order',
                              style: TextStyle(
                                  fontSize: 18, color: primaryColorLT),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
