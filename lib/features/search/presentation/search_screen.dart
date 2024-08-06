import 'package:flutter/material.dart';
import 'package:madang/features/search/presentation/recently_searched.dart';
import 'package:madang/features/search/widget/search_widget.dart';
import 'package:madang/routes/bottom_nav_bar.dart';
import 'package:madang/utils/theme/theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example popular search words
    List<String> popularSearches = [
      'Noodles',
      'Duo Table',
      'Fried Rice',
      'Meat',
      'Family'
    ];

    return Scaffold(
      backgroundColor: primaryColorLT,
      body: SafeArea(
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
                ),
                const SizedBox(height: 20),
                const Text(
                  "Popular Search",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColorDK,
                  ),
                ),
                const SizedBox(height: 10),
                // Wrap for popular searches with spacing
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 20, // Space between items
                    runSpacing: 10, // Space between rows
                    alignment: WrapAlignment
                        .start, // Align items to the start of the row
                    children: popularSearches.map((search) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F1F1),
                          borderRadius:
                              BorderRadius.circular(20), // High border radius
                        ),
                        child: Text(
                          search,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RecentlySearched()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
