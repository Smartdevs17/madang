import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  final int activeIndex;
  const BottomNavBar({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: primaryColorLT,
      ),
      height: 100.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: BottomNavBarButton(
              icon: "assets/svgs/home.svg",
              label: "Home",
              isActive: activeIndex == 0,
              onTap: () {
                if (activeIndex == 0) return;
                Get.offAllNamed(Routes.home);
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: BottomNavBarButton(
              icon: "assets/svgs/search.svg",
              label: "Search",
              isActive: activeIndex == 1,
              onTap: () {
                if (activeIndex == 1) return;
                if (activeIndex == 0) {
                  Get.toNamed(Routes.search);
                } else {
                  Get.offAndToNamed(Routes.search);
                }
              },
            ),
          ),
          Expanded(
              flex: 10,
              child: BottomNavBarButton(
                icon: "assets/svgs/refresh-circle.svg",
                label: "Recent",
                isActive: activeIndex == 2,
                onTap: () {
                  if (activeIndex == 2) return;
                  if (activeIndex == 0) {
                    Get.toNamed(Routes.recent);
                  } else {
                    Get.offAndToNamed(Routes.recent);
                  }
                },
              )),
          Expanded(
              flex: 10,
              child: BottomNavBarButton(
                icon: "assets/svgs/person.svg",
                label: "Profile",
                isActive: activeIndex == 3,
                onTap: () {
                  if (activeIndex == 3) return;
                  if (activeIndex == 0) {
                    Get.toNamed(Routes.profile);
                  } else {
                    Get.offAndToNamed(Routes.profile);
                  }
                },
              )),
        ],
      ),
    );
  }

  void logScreenView(String screenName) {}

  dynamic _onPageChange(int currentIndex) {}
}

// ignore: must_be_immutable
class BottomNavBarButton extends StatelessWidget {
  final bool isActive;
  final String icon;
  void Function()? onTap;
  final String label;
  final Widget? widget;
  BottomNavBarButton(
      {super.key,
      required this.isActive,
      required this.icon,
      this.label = '',
      this.widget,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        color: primaryColorLT,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.isNotEmpty
                  ? SizedBox(
                      height: 30,
                      child: SvgPicture.asset(
                        icon,
                        height: 26,
                        width: 26,
                        color: isActive ? mainColor : neutralGrey,
                      ),
                    )
                  : widget!,
              if (label.isNotEmpty)
                FittedBox(
                  child: Text(
                    label,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: isActive ? mainColor : neutralGrey),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
