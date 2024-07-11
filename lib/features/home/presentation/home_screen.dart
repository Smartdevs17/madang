import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:madang/features/home/presentation/recommendation_section.dart';
import 'package:madang/features/home/widget/icon_row.dart';
import 'package:madang/features/home/widget/image_slider.dart';
import 'package:madang/routes/bottom_nav_bar.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: primaryColorLT,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Michael",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Get your favorite food here!",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.cart);
                        },
                        child: SvgPicture.asset("assets/svgs/cart.svg"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const ImageSlider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  IconRow(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  RecommendationSection(),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(activeIndex: 0),
      ),
    );
  }
}
