import 'package:flutter/material.dart';

showLoading (BuildContext context) async {
  showDialog(context: context, barrierDismissible: false, builder: (_) => const AlertDialog(
      title: Text('Espere...'),
      content: LinearProgressIndicator(),
    )
  );


  await Future.delayed(const Duration(milliseconds: 2000));

  if (context.mounted) {  
    Navigator.of(context).pop();
  }
}
showAlert(BuildContext context, String title, String message) async {
  showDialog(context: context, barrierDismissible: false, builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        MaterialButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Ok'),)
      ],
    )
  );
}