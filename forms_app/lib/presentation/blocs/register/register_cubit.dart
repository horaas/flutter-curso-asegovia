import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());
  void onSummit() {
    print('summit $state');
  }
  userChanged(String value) {
    emit(state.copyWith(user: value));
  }

  emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  passChanged(String value) {
    emit(state.copyWith(pass: value));
  }
}
