import 'package:flutter/material.dart';
import 'package:qr_scanner/core/constants/colors.dart';

ThemeData ligthTheme() {
  return ThemeData(
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
  );
}
