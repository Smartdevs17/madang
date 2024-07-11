import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/food/presentation/food_item.dart';
import 'package:madang/features/table/presentation/table_item.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/theme/theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<CartItem> sampleCartItems = [
    //   CartItem(
    //     id: 'c1',
    //     title: 'Noodle Ex',
    //     quantity: 3,
    //     price: 4200,
    //   ),
    //   CartItem(
    //     id: 'c2',
    //     title: 'Burger Ala Ala',
    //     quantity: 1,
    //     price: 5500,
    //   ),
    //   CartItem(
    //     id: 'c3',
    //     title: 'Flower',
    //     quantity: 1,
    //     price: 2500,
    //   ),
    // ];

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Food",
                  style: TextStyle(
                      fontSize: 26,
                      color: primaryColorDK,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                FoodItem(),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.food);
                    },
                    child: Text(
                      "add more food",
                      style: TextStyle(
                          fontSize: 16,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Table",
                  style: TextStyle(
                      fontSize: 26,
                      color: primaryColorDK,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TableItem(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Additional",
                      style: TextStyle(
                          fontSize: 20,
                          color: primaryColorDK,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "add more",
                      style: TextStyle(
                          fontSize: 16,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1 X Flower",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "#2500",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Total",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColorDK,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Food",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "#4500",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Table",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "#0",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1 X Flower",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "#2500",
                      style: TextStyle(
                          fontSize: 16,
                          color: primaryColorDK,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: primaryColorLT,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(color: primaryColorDK, fontSize: 18),
                ),
                Text(
                  "#7000",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColorDK,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Place order logic
                showSnackbar(
                  message: 'Successfully placed order',
                  error: false,
                );
                Navigator.pop(context);
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
      ),
    );
  }
}
