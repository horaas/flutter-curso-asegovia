part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool exitUser;
  final User? user;


  const UserState({this.exitUser = false, this.user});

}

class InitialUserState extends UserState {
  const InitialUserState({super.exitUser = false});
}

class UserSetState extends UserState {
  final User user2;

  const UserSetState(this.user2): super(exitUser: true, user: user2);
  
}