import 'package:flutter/material.dart';
import 'package:qr_scanner/core/constants/colors.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    primaryColor: ThemeColors.main,
    secondaryHeaderColor: ThemeColors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
      headline3: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        color: ThemeColors.main,
        decoration: TextDecoration.underline,
      ),
      bodyText2: const TextStyle(
        fontSize: 15,
      ),
    ),
  ),
  AppTheme.dark: ThemeData(
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
  )
};
