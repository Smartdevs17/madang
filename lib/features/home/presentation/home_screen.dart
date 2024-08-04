import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:madang/features/home/controller/home_controller.dart';
import 'package:madang/features/recommendation/presentation/recommendation_section.dart';
import 'package:madang/features/home/widget/icon_row.dart';
import 'package:madang/features/home/widget/image_slider.dart';
import 'package:madang/features/profile/controller/profile_controller.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.find();
  final ProfileController _profileController = Get.find();

  HomeScreen({Key? key}) : super(key: key);

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
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: primaryColorLT,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (_homeController.loading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: mainColorDK,
                  ),
                );
              } else if (_homeController.error.value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _homeController.errorMessage.value,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _homeController.loadData();
                          },
                          child: const Text(
                            'Retry',
                            style: TextStyle(
                              color: primaryColorLT,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, ${_profileController.userProfile.name}",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
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
                    const SizedBox(height: 15.0),
                    const ImageSlider(),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            IconRow(),
                            const SizedBox(height: 20.0),
                            const RecommendationSection(),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
