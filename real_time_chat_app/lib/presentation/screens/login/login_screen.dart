import 'package:flutter/material.dart';
import 'package:real_time_chat_app/presentation/widgets/custom_button_blue.dart';
import 'package:real_time_chat_app/presentation/widgets/custom_text_field.dart';
import 'package:real_time_chat_app/presentation/widgets/icon_header_widget.dart';
import 'package:real_time_chat_app/presentation/widgets/labels_cutom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height *0.9,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconHeaderWidget(),
                _Form(),
                LabelsCustom(route: 'register', text: 'Crea una cuent ahora',),
                Text(
                  'Términos',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomTextField(
            type: TextInputType.emailAddress,
            icon: Icons.email_outlined,
            hint: 'Email',
            textEditingController: emailControl,
          ),
          CustomTextField(
            type: TextInputType.emailAddress,
            icon: Icons.lock_outline,
            hint: 'Password',
            isPass: true,
            textEditingController: passControl,
          ),
          const SizedBox(height: 20),
          CustomButtonBlue(
            text: 'Ingresar',
            onPressed: () {
              print(emailControl.text);
              print(passControl.text);
            },
          ),
        ],
      ),
    );
  }
}
