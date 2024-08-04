import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/recommendation/widget/recommendation_item.dart';
import 'package:madang/features/table/controller/table_controller.dart';
import 'package:madang/features/table/presentation/table_details.dart';

class RecommendationTableSection extends StatefulWidget {
  const RecommendationTableSection({super.key});

  @override
  State<RecommendationTableSection> createState() =>
      _RecommendationTableSectionState();
}

class _RecommendationTableSectionState
    extends State<RecommendationTableSection> {
  final TableController tableController = Get.find();

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
            children: tableController.recommendedTables.map((table) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Obx(() {
                  if (!tableController.loading.value) {
                    if (tableController.tables.isNotEmpty) {
                      return GestureDetector(
                        onTap: () => showTableDetails(context, table),
                        child: RecommendationItem(
                          image: table.image!,
                          rating: 4.7,
                          title: table.name!,
                          details:
                              '${table.number} table ${table.capacity} chair',
                          price: table.price!,
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
