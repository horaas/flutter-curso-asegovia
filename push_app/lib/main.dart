import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/blocs/notifications/notifications_bloc.dart';
import 'package:push_app/configs/configs.dart';
import 'package:push_app/configs/local_notification/local_notification.dart';
import 'package:push_app/presentation/handle_notification_interactios.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializedFCM();
  await LocalNotification.initializeLocalNotifications();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => NotificationsBloc())
    ],
    child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      builder: (context, child) => HandleNotificationInteractios(child: child!),
    );
  }
}
