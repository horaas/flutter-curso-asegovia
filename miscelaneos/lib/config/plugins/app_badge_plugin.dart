
import 'package:flutter_app_badge/flutter_app_badge.dart';

class AppBadgePlugin {
  // static Future<bool> get isAvailable async {
  //   return await FlutterAppBadge.
  // }

  static void updateBadge(int count) {
    FlutterAppBadge.count(count);
  }
}