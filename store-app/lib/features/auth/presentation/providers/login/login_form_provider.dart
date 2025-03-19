import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/shared/infraestructure/inputs.dart';

class LoginFormProviderState {
  final bool isPsting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormProviderState(
      {this.isPsting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  LoginFormProviderState copyWith({
    bool? isPsting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
  }) =>
      LoginFormProviderState(
        isPsting: isPsting ?? this.isPsting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  String toString() {
    return '''
LoginFormProviderState: 
isPsting $isPsting
isFormPosted $isFormPosted
isValid $isValid
email $email
password $password
''';
  }
}

class LoginFormNotifier extends StateNotifier<LoginFormProviderState> {
  LoginFormNotifier() : super(LoginFormProviderState());

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail, isValid: Formz.validate([newEmail, state.password]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email]));
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]));
  }
}


final loginFormProvider = StateNotifierProvider.autoDispose<LoginFormNotifier,LoginFormProviderState>((ref) {

  // final loginUserCallback = ref.watch(authProvider.notifier).loginUser;


  return LoginFormNotifier();
});