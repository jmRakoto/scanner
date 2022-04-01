import 'dart:io';

abstract class PlatformType {
  static bool android() => Platform.isAndroid;
  static bool ios() => Platform.isIOS;
}
