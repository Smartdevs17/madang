import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madang/utils/theme/theme.dart';

// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  final String hintText;
  SearchWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var hintText = "Search food, table or something";
    return TextFormField(
      textInputAction: TextInputAction.search, // Use search action
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start, // Align text to start (left)
      style: const TextStyle(color: primaryColorDK),
      // onFieldSubmitted: onSearchChanged, // Callback when search is submitted
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ), // Adjust padding as needed
        prefixIcon: const Icon(Icons.search),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: neutralGrey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: primaryColorLT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: neutralGrey, // Outline border color
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: neutralGrey, // Change color to purple when focused
            width: 1,
          ),
        ),
      ),
      cursorColor: mainColorDK,
    );
  }
}
