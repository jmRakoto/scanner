import 'package:flutter/material.dart';
import 'package:qr_scanner/core/constants/colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: ThemeColors.mainDark,
    secondaryHeaderColor: ThemeColors.bodyDark,
    iconTheme: IconThemeData(color: ThemeColors.white),
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline2: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline3: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        color: ThemeColors.white,
        decoration: TextDecoration.underline,
      ),
      bodyText2: TextStyle(
        fontSize: 15,
        color: ThemeColors.white,
      ),
    ),
  );
}
