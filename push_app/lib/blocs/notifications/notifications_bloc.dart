import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:push_app/configs/local_notification/local_notification.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(NotificationsState()) {
    on<NotificationStatusChanged>(_notificationChangeStatus);
    on<NotificationReceived>(_notificationReceived);
    _initialStatusCheck();

    _onForegroundMessage();

  }

  static Future<void> initializedFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationChangeStatus(
    NotificationStatusChanged event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  void requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await requestLocalPermissions();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();

    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    if (state.status != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    print(token);
  }

  void handleMessageREmote(RemoteMessage message) {
    print('Mensaje Recibido');
    print('Mensaje DAta: ${message.data}');

    if (message.notification == null) return;

    print('Mensaje: ${message.notification}');

    final notification = PushMessage(
      messageId:
          message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      sendDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl:
          Platform.isAndroid
              ? message.notification!.android?.imageUrl
              : message.notification!.apple?.imageUrl,
    );

    add(NotificationReceived(notification));
    print(notification.toString());
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleMessageREmote);
  }


  void _notificationReceived(
    NotificationReceived event,
    Emitter<NotificationsState> emit,
  ) {
    print(state.notification);
    emit(state.copyWith(notification: [event.pushMessage, ...state.notification]));
  }

  PushMessage? getMessageById(String pushId) {
    final exust = state.notification.any((element) => element.messageId == pushId,);

    if (!exust) return null;

    return state.notification.firstWhere((element) => element.messageId == pushId,);
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
