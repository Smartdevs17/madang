import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madang/utils/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.activeIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColorLT,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(.01),
            blurRadius: 10.0,
            offset: Offset(0, -5),
          ),
        ],
      ),
      height: 80.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: BottomNavBarButton(
              icon: "assets/svgs/home.svg",
              label: "Home",
              isActive: activeIndex == 0,
              onTap: () {
                if (activeIndex != 0) onItemTapped(0);
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
                if (activeIndex != 1) onItemTapped(1);
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
                if (activeIndex != 2) onItemTapped(2);
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: BottomNavBarButton(
              icon: "assets/svgs/person.svg",
              label: "Profile",
              isActive: activeIndex == 3,
              onTap: () {
                if (activeIndex != 3) onItemTapped(3);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarButton extends StatelessWidget {
  final bool isActive;
  final String icon;
  final void Function()? onTap;
  final String label;
  final Widget? widget;

  BottomNavBarButton({
    Key? key,
    required this.isActive,
    required this.icon,
    this.label = '',
    this.widget,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: isActive ? mainColor : neutralGrey,
              width: 2.0,
            ),
          ),
        ),
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
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: isActive ? mainColor : neutralGrey,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
