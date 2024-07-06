// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:writeapp/routes/routes.dart';
// import 'package:writeapp/utils/theme/theme.dart';

// class BottomBar extends StatelessWidget {
//   final int activeIndex;
//   const BottomBar({super.key, required this.activeIndex});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: subTextColor,
//       ),
//       height: 100.0,
//       // padding: EdgeInsets.only(bottom: 20),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 10,
//             child: BottomBarButton(
//               icon: "assets/svgs/document.svg",
//               label: "Documents",
//               isActive: activeIndex == 0,
//               onTap: () {
//                 if (activeIndex == 0) return;
//                 Get.toNamed(Routes.home);
//               },
//             ),
//           ),
//           Expanded(
//             flex: 10,
//             child: BottomBarButton(
//               icon: "assets/svgs/bookmark.svg",
//               label: "Reader Mode",
//               isActive: activeIndex == 1,
//               onTap: () {
//                 if (activeIndex == 1) return;
//                 if (activeIndex == 0) {
//                   Get.toNamed(Routes.document);
//                 } else {
//                   Get.offAndToNamed(Routes.document);
//                 }
//               },
//             ),
//           ),
//           Expanded(
//               flex: 10,
//               child: BottomBarButton(
//                 icon: "assets/svgs/settings.svg",
//                 label: "Settings",
//                 isActive: activeIndex == 2,
//                 onTap: () {
//                   if (activeIndex == 2) return;
//                   if (activeIndex == 0) {
//                     Get.toNamed(Routes.settings);
//                   } else {
//                     Get.offAndToNamed(Routes.settings);
//                   }
//                 },
//               )),
//         ],
//       ),
//     );
//   }

//   void logScreenView(String screenName) {}

//   dynamic _onPageChange(int currentIndex) {}
// }

// // ignore: must_be_immutable
// class BottomBarButton extends StatelessWidget {
//   final bool isActive;
//   final String icon;
//   void Function()? onTap;
//   final String label;
//   final Widget? widget;
//   BottomBarButton(
//       {super.key,
//       required this.isActive,
//       required this.icon,
//       this.label = '',
//       this.widget,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: double.infinity,
//         color: subTextColor,
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               icon.isNotEmpty
//                   ? SizedBox(
//                       height: 30,
//                       child: SvgPicture.asset(
//                         icon,
//                         height: 26,
//                         width: 26,
//                         color: isActive ? primaryColorLT : secondaryColor,
//                       ),
//                     )
//                   : widget!,
//               if (label.isNotEmpty)
//                 FittedBox(
//                   child: Text(
//                     label,
//                     maxLines: 1,
//                     style: TextStyle(
//                         fontSize: 12.0,
//                         fontWeight: FontWeight.w700,
//                         color: isActive ? primaryColorLT : secondaryColor),
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
