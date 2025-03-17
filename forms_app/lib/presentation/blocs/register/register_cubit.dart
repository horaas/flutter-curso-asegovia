import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infraestructure/infraestruscture.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());
  void onSummit() {
    print('summit $state');
  }

  userChanged(String value) {
    final user = Username.dirty(value);
    emit(state.copyWith(user: user, isValid: Formz.validate([user, state.pass])));
  }

  emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  passChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(pass: password, isValid: Formz.validate([password, state.user])));
  }
}
