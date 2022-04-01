import 'package:flutter/widgets.dart';

abstract class SizeUtils {
  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static horizontalSpace(double space) {
    return SizedBox(
      width: space,
    );
  }

  static verticalSpace(double space) {
    return SizedBox(
      height: space,
    );
  }
}
