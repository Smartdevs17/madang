import 'package:flutter/material.dart';
import 'package:madang/features/home/presentation/recommendation_item.dart';
import 'package:madang/utils/theme/theme.dart';

// ignore: use_key_in_widget_constructors
class RecentlySearched extends StatelessWidget {
  final List<RecommendationItem> recommendations = [
    const RecommendationItem(
      image: 'assets/images/Group 3.png',
      rating: 4.7,
      title: 'Family Package',
      details: '1 large table 6 chair',
      price: '#15000.00',
    ),
    const RecommendationItem(
      image: 'assets/images/Group 5.png',
      rating: 4.9,
      title: 'Data Package',
      details: '1 table 1 chair',
      price: '#3500.00',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recently Search',
          style: TextStyle(
            color: primaryColorDK,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: recommendations.map((item) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: item,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
