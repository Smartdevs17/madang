import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//static colors
const Color textColor = Colors.black;
const Color hintColor = Colors.grey;
const Color subTextColor = Color.fromRGBO(47, 46, 43, 100);
const Color bottomBarColor = Color.fromRGBO(21, 21, 21, 95);
const Color primaryColorLT = Colors.white;
const Color primaryColorDK = Colors.black;
const Color secondaryColor = Color(0xff49516F);
const Color darkGrey = Color.fromARGB(1000, 231, 231, 231);
const Color mainColor = Color(0xFF008C8C);
const Color mainColorLT = Color(0xffCCE8E8);
const Color mainColorDK = Color(0xff007070);
const Color neutralGrey = Color(0xffB3B3B3);

///Text
const bodyText1 =
    TextStyle(color: textColor, fontSize: 16.0, fontWeight: FontWeight.bold);

const bodyText2 =
    TextStyle(color: textColor, fontSize: 14.0, fontWeight: FontWeight.normal);

/// App Theme
final ThemeData appTheme = ThemeData(
  // Existing appBarTheme, tabBarTheme, inputDecorationTheme, elevatedButtonTheme
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  tabBarTheme: const TabBarTheme(
      labelColor: Colors.white, unselectedLabelColor: Colors.grey),
  inputDecorationTheme: const InputDecorationTheme(),
  elevatedButtonTheme: elevatedButtonThemeData,
  textTheme: const TextTheme(
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
  ),
  // Set default font family to Lato Regular
  fontFamily: "Kantumruy",
);

final InputDecoration inputDecoration = InputDecoration(
  hintStyle: bodyText2.copyWith(color: textColor.withOpacity(0.6)),
  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
  fillColor: hintColor,
  filled: true,
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  ),
);
final ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)))));

final OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: primaryColorDK),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  ),
);
