part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formState;
  final Username user;
  final Email email;
  final Password pass;
  final bool isValid;

  const RegisterFormState({
    this.user = const Username.pure(),
    this.email = const Email.pure(),
    this.pass = const Password.pure(),
    this.formState = FormStatus.invalid,
    this.isValid = false
  });

  RegisterFormState copyWith({
    FormStatus? formState,
    Username? user,
    Email? email,
    Password? pass,
    bool? isValid
  }) => RegisterFormState(
    user: user ?? this.user,
    email: email ?? this.email,
    pass: pass ?? this.pass,
    formState: formState ?? this.formState,
    isValid: isValid ?? this.isValid
  );

  @override
  List<Object> get props => [user, email, pass, formState, isValid];
}
