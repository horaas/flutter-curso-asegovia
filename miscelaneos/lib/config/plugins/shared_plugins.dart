
import 'package:share_plus/share_plus.dart';

class SharedPlugins {
  static sharedLink(String text, String subject) {
    Share.share(text, subject: subject);
  }
}