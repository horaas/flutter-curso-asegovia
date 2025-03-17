import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forms_app/presentation/widgets/custom_text_form_field.dart';

class CreateNewUserScreen extends StatelessWidget {
  const CreateNewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: _RegisterForm(),
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
  String user = '';
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
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
              onChanged: (value) => user = value,
              validator: (value) {
                if (user.isEmpty) return 'no puede estar vacio';
                if (user.length <= 5) return 'el valor debe ser mayo a 5';
                return null;
              },
            ),
            CustomTextFormField(
              labelText: 'Corre',
              type: TextInputType.emailAddress,
              onChanged: (value) => email = value,
              validator: (p0) {
                
                 final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (email.isEmpty) return 'no puede estar vacio';
                if (!emailRegExp.hasMatch(email)) return 'Email invalido';
                return null;
              },
            ),
            CustomTextFormField(
              labelText: 'contraseña',
              isSecure: true,
              onChanged: (value) => pass = value,
              validator: (p0) {
                if (pass.isEmpty) return 'no puede estar vacio';
                if (pass.length <= 5) return 'el valor debe ser mayo a 5';
                return null;
              },
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('valido $user, $pass, $email');
                }
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
