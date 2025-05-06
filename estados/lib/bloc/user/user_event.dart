part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;

  ActivateUser(this.user);

}
class ChangeEdadUser extends UserEvent {
  final int edad;

  ChangeEdadUser(this.edad);

}
class AddProfetiondUser extends UserEvent {

  AddProfetiondUser();

}
class RemoveUser extends UserEvent {

  RemoveUser();

}