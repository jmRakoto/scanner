import 'package:flutter/cupertino.dart';

Future navitageTo(BuildContext context, String path) {
  return Navigator.pushNamed(context, path);
}

Future navigateToAndRemplace(BuildContext context, String path) {
  return Navigator.of(context)
      .pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false);
}
