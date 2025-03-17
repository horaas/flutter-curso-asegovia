import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/custom_text_form_field.dart';

class CreateNewUserScreen extends StatelessWidget {
  const CreateNewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: _RegisterForm()),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final userName = registerCubit.state.user;
    final password = registerCubit.state.pass;
    final email = registerCubit.state.email;

    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Icon(FontAwesomeIcons.userPlus, size: 120)),
            CustomTextFormField(
              labelText: 'Nombre de usuario',
              onChanged: (value) => registerCubit.userChanged(value),
              errorMessage: userName.isPure ? null : userName.errorMessage,
            ),
            CustomTextFormField(
              labelText: 'Corre',
              type: TextInputType.emailAddress,
              onChanged: (value) => registerCubit.emailChanged(value),
              errorMessage: email.isPure ? null : email.errorMessage,
            ),
            CustomTextFormField(
              labelText: 'contraseña',
              isSecure: true,
              onChanged: (value) => registerCubit.passChanged(value),
              errorMessage: password.isPure ? null : password.errorMessage,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                registerCubit.onSummit();
                // print(registerCubit.state.user.error?.errorMessage());
              },
              icon: Icon(FontAwesomeIcons.floppyDisk),
              label: Text('Crear usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
