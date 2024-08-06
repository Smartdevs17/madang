// table_details.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/cart/controller/cart_controller.dart';
import 'package:madang/features/table/model/table_model.dart';
import 'package:madang/features/table/presentation/addon_selection.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/theme/theme.dart';

Future<void> showTableDetails(BuildContext context, TableModel table) async {
  final CartController _cartController = Get.find();

  List<String> times = [
    '30 minutes',
    '45 minutes',
    '1 hour',
    '2 hours',
  ];

  String selectedTime = '';
  bool isCustomTime = false;
  TextEditingController customTimeController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: SizedBox(
                          width: 28,
                          child: Divider(
                            color: neutralGrey,
                            height: 2,
                            thickness: 3,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10, // Space between items
                        runSpacing: 10, // Space between rows
                        alignment: WrapAlignment
                            .start, // Align items to the start of the row
                        children: times.map((time) {
                          bool isSelected = selectedTime == time;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = time;
                                isCustomTime = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? mainColor
                                    : const Color(0xffF3F1F1),
                                borderRadius: BorderRadius.circular(
                                    20), // High border radius
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    time,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : primaryColorDK,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  if (isSelected)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedTime = "";
                                            isSelected = false;
                                          });
                                        },
                                        child: Container(
                                          height: 12,
                                          width: 12,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColorLT,
                                          ),
                                          child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(0.1),
                                              child: Text(
                                                "x",
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      if (!isCustomTime)
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isCustomTime = !isCustomTime;
                                if (isCustomTime) {
                                  selectedTime = 'custom';
                                }
                              });
                            },
                            child: const Text(
                              "custom time",
                              style: TextStyle(
                                fontSize: 16,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      if (isCustomTime)
                        RadioListTile(
                          value: "custom",
                          groupValue: selectedTime,
                          onChanged: (value) {
                            setState(() {
                              selectedTime = value.toString();
                              isCustomTime = false;
                            });
                          },
                          activeColor: mainColor,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: customTimeController,
                                decoration: InputDecoration(
                                  hintText: '10 minutes',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: neutralGrey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                "example: 10 minutes, 1 hour",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 10),
                      const AddonSelection(),
                      const SizedBox(height: 10),
                      const Column(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Book table logic
                          _cartController.addTableToCart(table);
                          Get.snackbar('Added to Cart',
                              '${table.name} has been added to your cart.');
                          // showSnackbar(
                          //   message: 'Successfully booking table',
                          //   error: false,
                          // );
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Book Table',
                          style: TextStyle(fontSize: 16, color: primaryColorLT),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
    },
  );
}
