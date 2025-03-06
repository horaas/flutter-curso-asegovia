import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('hola'),
      action: SnackBarAction(label: 'Ok', onPressed: () {},),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and dialogs'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('mostrar snack'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showSnackBar(context),
      ),
    );
  }
}
