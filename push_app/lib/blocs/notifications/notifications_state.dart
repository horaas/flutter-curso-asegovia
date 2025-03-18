part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final AuthorizationStatus status;
  final List<dynamic> notification;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notification = const [],
  });

  NotificationsState copyWith({
    AuthorizationStatus? status,
    List<dynamic>? notification,
  }) => NotificationsState(
    notification: notification ?? this.notification,
    status: status ?? this.status,
  );

  @override
  List<Object> get props => [];
}
