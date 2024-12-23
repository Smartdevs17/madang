import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onSearchChanged;

  SearchWidget({
    Key? key,
    required this.hintText,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,
      style: const TextStyle(color: primaryColorDK),
      onChanged: onSearchChanged, // Callback as the user types
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
          borderSide: const BorderSide(color: neutralGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: neutralGrey, width: 1),
        ),
      ),
      cursorColor: mainColorDK,
    );
  }
}
