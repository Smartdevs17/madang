import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/cart/widget/cart_icon.dart';
import 'package:madang/features/food/controller/food_controller.dart';
import 'package:madang/features/food/model/food_model.dart';
import 'package:madang/features/food/presentation/food_details.dart';
import 'package:madang/features/search/widget/search_widget.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/action/format_price.dart';
import 'package:madang/utils/theme/theme.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final FoodController foodController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text(
          'Food',
          style: TextStyle(
            color: primaryColorDK,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: primaryColorDK),
        elevation: 1.0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 16),
            child: CartIcon(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchWidget(
              hintText: "Search Food",
              onSearchChanged: (query) {
                foodController.searchItems(query);
              },
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                if (!foodController.loading.value) {
                  if (foodController.foodCategories.isNotEmpty) {
                    return Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: foodController.foodCategories.map((category) {
                        return Chip(
                          label: Text(category),
                          backgroundColor: const Color(0xffF3F1F1),
                        );
                      }).toList(),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              }),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (foodController.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (foodController.error.value) {
                  return Center(child: Text(foodController.errorMessage.value));
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: foodController.foods.length,
                    itemBuilder: (context, index) {
                      final food = foodController.foods[index];
                      return GestureDetector(
                        onTap: () => showFoodDetails(context, food),
                        child: Card(
                          color: primaryColorLT,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8.0)),
                                    child: Image.network(
                                      food.image ??
                                          'assets/images/Intersect.png',
                                      height: constraints.maxHeight * 0.5,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            food.name ?? '',
                                            style:
                                                const TextStyle(fontSize: 16),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                color: Colors.amber, size: 16),
                                            const SizedBox(width: 4),
                                            Text(
                                              food.averageRating?.toString() ??
                                                  'N/A',
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          formatPrice(food.price!),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
