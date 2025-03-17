import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infraestructure/infraestruscture.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());
  void onSummit() {
    emit(
      state.copyWith(
        formState: FormStatus.validating,
        user: Username.dirty(state.user.value),
        isValid: Formz.validate([state.user, state.pass]),
        pass: Password.dirty(state.pass.value),
        email: Email.dirty(state.email.value),
      ),
    );
    print('summit $state');
  }

  userChanged(String value) {
    final user = Username.dirty(value);
    emit(
      state.copyWith(user: user, isValid: Formz.validate([user, state.pass, state.email])),
    );
  }

  emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(email: email, isValid: Formz.validate([state.user, state.pass, email])),
    );
  }

  passChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        pass: password,
        isValid: Formz.validate([password, state.user, state.email]),
      ),
    );
  }
}
