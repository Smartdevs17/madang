import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Madang",
              style: TextStyle(
                  color: mainColor, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Booking a table and food from \neverywhere.",
              style: TextStyle(
                  fontSize: 20,
                  color: primaryColorDK,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.register);
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
                    "Sign Up",
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
                Get.toNamed(Routes.login);
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
                    "Login",
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
