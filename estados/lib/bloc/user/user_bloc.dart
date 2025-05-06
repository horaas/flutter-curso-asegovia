
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:estados/models/user.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(): super(const InitialUserState()) {
    on<ActivateUser>((event, emit) {
      print('actibate user');
      emit(
        UserSetState(event.user)
      );
    });
    on<ChangeEdadUser>((event, emit) {
      print('edad user');
      if (!state.exitUser) return;

      final newUser = state.user!.copyWith(
        edad: event.edad
      );

      emit(
        UserSetState(newUser)
      );
    });
    on<AddProfetiondUser>((event, emit) {
      print('profesion user');
      if (!state.exitUser) return;

      final newUser = state.user!.copyWith(
        profesiones: [...state.user!.profesiones, 'nueva profesion ${state.user!.profesiones.length}']
      );
      emit(
        UserSetState(newUser)
      );
    });
    on<RemoveUser>((event, emit) {

      emit(
        const InitialUserState()
      );
    });
  }


  
}
