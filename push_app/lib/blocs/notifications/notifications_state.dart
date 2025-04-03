part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final AuthorizationStatus status;
  final List<PushMessage> notification;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notification = const [],
  });

  NotificationsState copyWith({
    AuthorizationStatus? status,
    List<PushMessage>? notification,
  }) => NotificationsState(
    notification: notification ?? this.notification,
    status: status ?? this.status,
  );

  // TODO siempre colocar los props ya que si no se coloca no funciona correctamente
  @override
  List<Object> get props => [status, notification];
}
