import 'package:flutter/material.dart';
import 'package:madang/features/home/presentation/recommendation_item.dart';
import 'package:madang/utils/theme/theme.dart';

// ignore: use_key_in_widget_constructors
class RecommendationSection extends StatelessWidget {
  final List<RecommendationItem> recommendations = [
    const RecommendationItem(
      image: 'assets/images/Group 3.png',
      rating: 4.7,
      title: 'Family Package',
      details: '1 large table 6 chair',
      price: '#15000.00',
    ),
    const RecommendationItem(
      image: 'assets/images/Group 4.png',
      rating: 4.9,
      title: 'Single Breakfast',
      details: '1 table 1 chair',
      price: '#3500.00',
    ),
    const RecommendationItem(
      image: 'assets/images/Group 4.png',
      rating: 5.0,
      title: 'Single Breakfast',
      details: '1 table 1 chair',
      price: '#2000.00',
    ),
    const RecommendationItem(
      image: 'assets/images/Group 3.png',
      rating: 4.7,
      title: 'Family Package',
      details: '1 large table 6 chair',
      price: 'Rp320.000',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommendation',
          style: TextStyle(
              color: primaryColorDK, fontSize: 16, fontWeight: FontWeight.bold),
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