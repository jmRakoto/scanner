import 'package:url_launcher/url_launcher.dart';

abstract class Services {
  static bool isUrl(String data) {
    return data.startsWith('http');
  }

  static void launchURL(String url) async {
    try {
      await launch(url);
    } catch (error) {
      throw 'Could not launch $url $error';
    }
  }
}
