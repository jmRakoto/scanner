import 'package:flutter/material.dart';
import 'package:qr_scanner/presentation/views/pages/scanner/scanner.dart';
import 'package:qr_scanner/presentation/views/pages/splash/pages/splash_page.dart';

abstract class Routes {
  static const String splash = "/";
  static const String home = "/home";
}

abstract class AppRoute {
  static String initial = Routes.splash;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.splash: (context) => const SplashPage(),
    Routes.home: (context) => const ScannerPage(),
  };
}
