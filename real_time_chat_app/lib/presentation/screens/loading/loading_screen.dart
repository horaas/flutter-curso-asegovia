import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_chat_app/presentation/screens/login/login_screen.dart';
import 'package:real_time_chat_app/presentation/screens/users/users_screen.dart';
import 'package:real_time_chat_app/providers/auth_service.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _validateLogin(context),
        builder: (context, snapshot) =>  const Center(
          child: Text('LoadingPage'),
             ),
      ),
   );
  }

  Future<void> _validateLogin(BuildContext context) async {
    final authServices = Provider.of<AuthService>(context, listen: false);
    final isAutenticated = await authServices.isAutenticate();
    if (isAutenticated) {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const UsersScreen(),
            transitionDuration: const Duration(milliseconds: 0),
          ),
        );
      }
    } else {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const LoginScreen(),
            transitionDuration: const Duration(milliseconds: 0),
          ),
        );
      }
    }
  }
}
