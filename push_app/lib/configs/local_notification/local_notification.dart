import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> requestLocalPermissions() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.requestNotificationsPermission();
}
