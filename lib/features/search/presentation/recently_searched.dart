import 'package:flutter/material.dart';
import 'package:madang/features/food/model/food_model.dart';
import 'package:madang/features/recommendation/widget/recommendation_item.dart';
import 'package:madang/features/table/model/table_model.dart';

class RecentlySearched extends StatelessWidget {
  final List<FoodModel> foods;
  final List<TableModel> tables;

  const RecentlySearched({
    Key? key,
    required this.foods,
    required this.tables,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search Results',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          if (foods.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Foods',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return RecommendationItem(
                      image: food.image!,
                      rating: 4.5,
                      title: food.name!,
                      details: '',
                      price: food.price!,
                    );
                  },
                ),
              ],
            ),
          if (tables.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tables',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: tables.length,
                  itemBuilder: (context, index) {
                    final table = tables[index];
                    return RecommendationItem(
                      image: table.image!,
                      rating: 4.5,
                      title: table.name!,
                      // details: '${table.number} table ${table.capacity} chair',
                      details: '',
                      price: table.price!,
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
