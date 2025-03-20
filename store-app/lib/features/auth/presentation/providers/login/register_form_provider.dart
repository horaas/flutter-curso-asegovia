import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/auth/presentation/providers/providers.dart';
import 'package:teslo_shop/features/shared/infraestructure/inputs/inputs.dart';

final registerFormProvider = StateNotifierProvider.autoDispose<
    RegisterFormNotifier, RegisterFormProviderState>((ref) {
      final registerUserCallback = ref.watch(authProvider.notifier).register;
  return RegisterFormNotifier(registerUserCallback: registerUserCallback);
});

class RegisterFormNotifier extends StateNotifier<RegisterFormProviderState> {
  final Function(String, String, String) registerUserCallback ;

  RegisterFormNotifier({required this.registerUserCallback}) : super(RegisterFormProviderState());

  onNameChange(String value) {
    final name = OnlyLetter.dirty(value);
    state = state.copyWith(
        name: name,
        isValid:
            Formz.validate([name, state.email, state.password, state.confirmPassword]));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid:
            Formz.validate([newEmail, state.password, state.confirmPassword, state.name]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid:
            Formz.validate([newPassword, state.email, state.confirmPassword, state.name]));
  }

  onconfirmPasswordChanged(String value) {
    final confirmPassword = Password.dirty(value);
    state = state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([confirmPassword, state.email, state.password, state.name]));
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;
    registerUserCallback(state.name.value, state.email.value, state.password.value);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final confirmpassword = Password.dirty(state.confirmPassword.value);
    final name = OnlyLetter.dirty(state.name.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: confirmpassword,
        confirmPassword: state.confirmPassword,
        name: name,
        isValid: Formz.validate([email, password, confirmpassword, name]));
  }
}

class RegisterFormProviderState {
  final bool isPsting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;
  final Password confirmPassword;
  final OnlyLetter name;

  RegisterFormProviderState({
    this.isPsting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.name = const OnlyLetter.pure()
  });

  RegisterFormProviderState copyWith({
    bool? isPsting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
    Password? confirmPassword,
    OnlyLetter? name
  }) =>
      RegisterFormProviderState(
        isPsting: isPsting ?? this.isPsting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        name: name ?? this.name,
      );
}
