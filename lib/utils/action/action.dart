import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

void showSnackbar({String? message, String? title, bool error = false}) {
  Get.showSnackbar(
    GetSnackBar(
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: error ? Colors.red : const Color(0xff49516f),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "$message",
              style: const TextStyle(fontSize: 18, color: primaryColorLT),
              overflow:
                  TextOverflow.ellipsis, // Optional: truncates if too long
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    ),
  );
}
