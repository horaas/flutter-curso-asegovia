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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Icon(FontAwesomeIcons.userPlus, size: 120)),
            CustomTextFormField(
              labelText: 'Nombre de usuario',
              onChanged: (value) => registerCubit.userChanged(value),
              validator: (value) {
                if ( value == null && value!.isEmpty) return 'no puede estar vacio';
                if (value.length <= 5) return 'el valor debe ser mayo a 5';
                return null;
              },
            ),
            CustomTextFormField(
              labelText: 'Corre',
              type: TextInputType.emailAddress,
              onChanged: (value) => registerCubit.emailChanged(value),
              validator: (value) {
                final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (value == null && value!.isEmpty) return 'no puede estar vacio';
                if (!emailRegExp.hasMatch(value)) return 'Email invalido';
                return null;
              },
            ),
            CustomTextFormField(
              labelText: 'contraseña',
              isSecure: true,
              onChanged: (value) => registerCubit.passChanged(value),
              validator: (value) {
                if (value == null && value!.isEmpty) return 'no puede estar vacio';
                if (value.length <= 5) return 'el valor debe ser mayo a 5';
                return null;
              },
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   print('valido');
                //   registerCubit.onSummit();
                // }
                registerCubit.onSummit();
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
