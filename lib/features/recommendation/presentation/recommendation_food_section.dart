import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/food/controller/food_controller.dart';
import 'package:madang/features/food/presentation/food_details.dart';
import 'package:madang/features/recommendation/widget/recommendation_item.dart';

class RecommendationFoodSection extends StatefulWidget {
  const RecommendationFoodSection({super.key});

  @override
  State<RecommendationFoodSection> createState() =>
      _RecommendationFoodSectionState();
}

class _RecommendationFoodSectionState extends State<RecommendationFoodSection> {
  final FoodController foodController = Get.find();

  List<String> times = [
    '30 minutes',
    '45 minutes',
    '1 hour',
    '2 hours',
  ];

  String selectedTime = '';

  bool isCustomTime = false;

  TextEditingController customTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: foodController.recommendedFoods.map((food) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Obx(() {
                  if (!foodController.loading.value) {
                    if (foodController.foods.isNotEmpty) {
                      return GestureDetector(
                        onTap: () => showFoodDetails(context, food),
                        child: RecommendationItem(
                          image: food.image!,
                          rating: 4.7,
                          title: food.name!,
                          details: food.description!,
                          price: food.price!,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                }),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
