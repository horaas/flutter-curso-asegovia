import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forms_app/presentation/widgets/custom_text_form_field.dart';

class CreateNewUserScreen extends StatelessWidget {

  const CreateNewUserScreen({super.key});

  // GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: _RegisterForm(),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Icon(FontAwesomeIcons.userPlus, size: 120)),
            CustomTextFormField(labelText: 'Nombre de usuario',),
            CustomTextFormField(labelText: 'Corre', type: TextInputType.emailAddress,),
            CustomTextFormField(labelText: 'contraseña', isSecure: true,),
            FilledButton.tonalIcon(onPressed: (){
              // if (formKey.currentState!.validate()) {
              //   print('valido');
              // }
            }, icon: Icon(FontAwesomeIcons.floppyDisk), label: Text('Crear usuario'),)
          ],
        ),
      ),
    );
  }
}
