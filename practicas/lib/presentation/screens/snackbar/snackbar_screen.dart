import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('hola'),
      action: SnackBarAction(label: 'Ok', onPressed: () {},),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }


  void openDialog(BuildContext context) {
    showDialog(context: context, barrierDismissible: false, builder: (context) => AlertDialog(
      title: const Text('Estas seguri?'),
      content: const Text("estas segurio?"),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text("Cancelar")),
        TextButton(onPressed: () => context.pop(), child: const Text("Aceptar"))
      ],
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text("cualquier cosa")
                ]);
            }, child: const Text("Licenciasn usadas")),
            FilledButton.tonal(onPressed: () {
              openDialog(context);
            }, child: const Text("mostrar dialogs"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('mostrar snack'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showSnackBar(context),
      ),
    );
  }
}
