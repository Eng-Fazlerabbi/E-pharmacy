import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;


Color kSeceonndaryColor = Colors.teal.shade400.withOpacity(0.9);

SystemUiOverlayStyle? uiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarColor: Colors.black,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: kSeceonndaryColor,
);

ThemeData theme = ThemeData(
  appBarTheme: appBarTheme,
  backgroundColor: white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black45,
    selectedItemColor: kSeceonndaryColor,
  ),
  fontFamily: GoogleFonts.mulish().fontFamily,
  iconTheme: iconThemeData,
  inputDecorationTheme: inputDecorationTheme,
  scaffoldBackgroundColor: white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: kSeceonndaryColor,
  elevation: 0.0,
  textTheme: const TextTheme(
    headline6: const TextStyle(
      fontSize: 20,
    ),
  ),
);

IconThemeData iconThemeData = IconThemeData(
  color: kSeceonndaryColor,
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  border: outlineInputBorder,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  gapPadding: 10,
);

const BoxDecoration tabDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(30)),
);

TextStyle tsSize(double x) => TextStyle(fontSize: x);

TextStyle tsColorSize(double x) => TextStyle(fontSize: x, color: kSeceonndaryColor );

TextStyle tsWhiteSize(double x) => TextStyle(fontSize: x, color: white);

TextStyle tsSecColSize(double x) =>
    TextStyle(fontSize: x, color: kSeceonndaryColor);

TextStyle tsBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.bold);

TextStyle tsEBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.w900);

TextStyle tsColorBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.bold, color: kSeceonndaryColor);

TextStyle tsColorEBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.w900, color: kSeceonndaryColor);

TextStyle tsWhiteBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.bold, color: white);

TextStyle tsWhiteEBoldSize(double x) =>
    TextStyle(fontSize: x, fontWeight: FontWeight.w900, color: white);

TextStyle tsSecColBoldSize(double x) => TextStyle(
    fontSize: x, fontWeight: FontWeight.bold, color: kSeceonndaryColor);

TextStyle tsSecColEBoldSize(double x) => TextStyle(
    fontSize: x, fontWeight: FontWeight.w900, color: kSeceonndaryColor);
