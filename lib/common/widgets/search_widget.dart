// import 'package:flutter/material.dart';
// import 'package:writeapp/utils/theme/theme.dart';

// class SearchWidget extends StatelessWidget {
//   final Function(String)? onSearchChanged;
//   const SearchWidget({Key? key, this.onSearchChanged}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       textInputAction: TextInputAction.search, // Use search action
//       keyboardType: TextInputType.text,
//       textAlign: TextAlign.center,
//       style: const TextStyle(color: primaryColorLT),
//       onFieldSubmitted: onSearchChanged, // Callback when search is submitted
//       decoration: inputDecoration.copyWith(
//         hintText: "Search",
//         hintStyle: const TextStyle(
//           color: primaryColorLT,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//         filled: true,
//         fillColor: subTextColor,
//       ),
//     );
//   }
// }
