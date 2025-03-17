part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formState;
  final String user;
  final String email;
  final String pass;

  const RegisterFormState({
    this.user = '',
    this.email = '',
    this.pass = '',
    this.formState = FormStatus.invalid,
  });

  RegisterFormState copyWith({
    FormStatus? formState,
    String? user,
    String? email,
    String? pass,
  }) => RegisterFormState(
    user: user ?? this.user,
    email: email ?? this.email,
    pass: pass ?? this.pass,
    formState: formState ?? this.formState,
  );

  @override
  List<Object> get props => [user, email, pass, formState];
}
