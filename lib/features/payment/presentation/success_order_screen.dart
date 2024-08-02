import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/success.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "You've Made Order!",
              style: TextStyle(
                  fontSize: 20,
                  color: primaryColorDK,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.cart);
              },
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Check Order",
                    style: TextStyle(
                        color: primaryColorLT,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.index);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor),
                  color: primaryColorLT,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Back Home",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
