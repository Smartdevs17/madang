import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madang/utils/theme/theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
              left: 8, right: 8), // Adjust padding as needed
          child: SvgPicture.asset(
            "assets/svgs/search1.svg",
          ),
        ),
        hintText: "Search food, table or something",
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
    );
  }
}
