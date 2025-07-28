import 'package:url_launcher/url_launcher.dart';

class LinkLauncher {
  /// Launches a URL in the default browser.
  static Future<void> openSite(String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      throw 'Could not launch $url';
    }
  }
}
