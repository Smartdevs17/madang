import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:madang/features/cart/controller/cart_controller.dart';
import 'package:madang/features/food/presentation/food_item.dart';
import 'package:madang/features/profile/controller/profile_controller.dart';
import 'package:madang/features/table/presentation/table_item.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/action/format_price.dart';
import 'package:madang/utils/constants/constants.dart';
import 'package:madang/utils/theme/theme.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final ProfileController _profileController = Get.find();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        backgroundColor: primaryColorLT,
        title: const Text(
          "Detail Cart",
          style: TextStyle(
              fontSize: 24, color: primaryColorDK, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 1,
        shadowColor: primaryColorLT,
      ),
      body: cartController.cartItems.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                // Center the Column within the Padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/bag.svg"),
                    const SizedBox(
                        height: 20), // Adjust space between the SVG and text
                    const Text(
                      "Well, there is no item in your \n cart :(",
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center, // Center text
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Find Item',
                        style: TextStyle(fontSize: 18, color: primaryColorLT),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SafeArea(
              child: Obx(() {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Food",
                          style: TextStyle(
                              fontSize: 26,
                              color: primaryColorDK,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ...cartController.cartItems
                            .where((item) => item.food != null)
                            .map((item) {
                          return Column(
                            children: [
                              FoodItem(
                                food: item.food!,
                                quantity: item.quantity,
                                onQuantityChanged: (newQuantity) {
                                  cartController.updateQuantity(
                                      item, newQuantity);
                                },
                                onRemove: () {
                                  cartController.removeItemFromCart(item);
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        }).toList(),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.food);
                            },
                            child: const Text(
                              "add more food",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Table",
                          style: TextStyle(
                              fontSize: 26,
                              color: primaryColorDK,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ...cartController.cartItems
                            .where((item) => item.table != null)
                            .map((item) {
                          return TableItem(
                            table: item.table!,
                            onRemove: () {
                              cartController.removeItemFromCart(item);
                            },
                          );
                        }).toList(),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.table);
                            },
                            child: const Text(
                              "add table",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Additional",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: primaryColorDK,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                // Add more logic for additional items
                              },
                              child: const Text(
                                "add more",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        // ...cartController.cartItems
                        //     .where((item) => item.additional != null)
                        //     .map((item) {
                        //   return ListTile(
                        //     title: Text(
                        //       item.additional?.name ?? '',
                        //       style: const TextStyle(
                        //           fontSize: 16, color: primaryColorDK),
                        //     ),
                        //     subtitle: Text(
                        //       formatPrice(item.additional!.price!),
                        //       style: const TextStyle(
                        //           fontSize: 16, color: primaryColorDK),
                        //     ),
                        //     trailing: IconButton(
                        //       icon: const Icon(Icons.delete, color: Colors.red),
                        //       onPressed: () {
                        //         cartController.removeItemFromCart(item);
                        //       },
                        //     ),
                        //   );
                        // }).toList(),
                        // const SizedBox(height: 15),
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 20,
                              color: primaryColorDK,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Food",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: primaryColorDK,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              formatPrice(cartController.totalFoodPrice),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColorDK,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Table",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: primaryColorDK,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              formatPrice(cartController.totalTablePrice),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColorDK,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Additional",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: primaryColorDK,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              formatPrice(cartController.totalAdditionalPrice),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColorDK,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
      bottomNavigationBar: cartController.cartItems.isNotEmpty
          ? Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: primaryColorLT,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total: ",
                          style: TextStyle(color: primaryColorDK, fontSize: 18),
                        ),
                        Text(
                          formatPrice(cartController.totalPrice),
                          style: const TextStyle(
                              fontSize: 20,
                              color: primaryColorDK,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // // Place order logic
                      // showSnackbar(
                      //   message: 'Successfully placed order',
                      //   error: false,
                      // );
                      // cartController.clearCart();
                      // Navigator.pop(context);
                      // Get.toNamed(Routes.paymentMethod);
                      int user_id = _profileController.userProfile.id;

                      Map<String, dynamic> body = {
                        'user_id': user_id,
                        'restaurant_id': 4,
                        'total_price': cartController.totalPrice,
                        'foods': cartController.cartItems
                            .where((item) => item.food != null)
                            .map((item) => {
                                  'id': item.food!.id,
                                  'quantity': item.quantity,
                                })
                            .toList(),
                        'tables': cartController.cartItems
                            .where((item) => item.table != null)
                            .map((item) => {
                                  'table_id': item.table!.id,
                                })
                            .toList(),
                        'special_notes': 'Please make one dish extra spicy.',
                        'status': 'pending',
                      };

                      print("===================>>>>>>>>>>$body");
                      cartController.placeOrder(body);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 18, color: primaryColorLT),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(),
    );
  }
}
