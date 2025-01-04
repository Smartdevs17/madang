import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madang/utils/action/format_price.dart';
import 'package:madang/utils/theme/theme.dart';

class RecommendationItem extends StatelessWidget {
  final String image;
  final double rating;
  final String title;
  final String details;
  final int price;

  const RecommendationItem({
    Key? key,
    required this.image,
    required this.rating,
    required this.title,
    required this.details,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150, // Adjusted height
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/ion_star.svg',
                        height: 14,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        rating.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Content section (wrapped in SingleChildScrollView for scrolling)
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           title,
          //           maxLines: 1, // Ensure it doesn't overflow
          //           overflow: TextOverflow.ellipsis,
          //           style: const TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 16,
          //           ),
          //         ),
          //         // const SizedBox(height: 4),
          //         Text(
          //           formatPrice(price),
          //           style: const TextStyle(
          //             color: mainColor,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 14,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          Container(
            height: 80, // Provide a bounded height
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatPrice(price),
                          style: const TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
