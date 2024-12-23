import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/home/controller/home_controller.dart';
import 'package:madang/features/recommendation/widget/recommendation_item.dart';
import 'package:madang/features/search/presentation/recently_searched.dart';
import 'package:madang/features/search/widget/search_widget.dart';
import 'package:madang/utils/theme/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final HomeController _homeController = Get.find();

  List<String> popularSearches = [
    'Noodles',
    'Duo Table',
    'Fried Rice',
    'Meat',
    'Family',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryColorDK,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  SearchWidget(
                    hintText: "Search food, table or something",
                    onSearchChanged: (query) {
                      setState(() {
                        _homeController.searchItems(query);
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (_homeController.foodController.foods.isNotEmpty ||
                        _homeController.tableController.tables.isNotEmpty) {
                      return RecentlySearched(
                        foods: _homeController.foodController.foods,
                        tables: _homeController.tableController.tables,
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Popular Search",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColorDK,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 20,
                            children: popularSearches.map((search) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _homeController.searchItems(search);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF3F1F1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    search,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
