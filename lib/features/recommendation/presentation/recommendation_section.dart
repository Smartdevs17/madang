import 'package:flutter/material.dart';
import 'package:madang/features/recommendation/presentation/recommendation_food_section.dart';
import 'package:madang/features/recommendation/presentation/recommendation_table_section.dart';
import 'package:madang/utils/theme/theme.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendations',
          style: TextStyle(
            color: primaryColorDK,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        RecommendationFoodSection(),
        SizedBox(height: 15),
        RecommendationTableSection(),
        SizedBox(height: 15),
      ],
    );
  }
}
