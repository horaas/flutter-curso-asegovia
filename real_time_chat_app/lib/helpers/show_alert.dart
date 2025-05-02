import 'package:flutter/material.dart';

class ShowALert {
  final BuildContext context;

  ShowALert({required this.context});

  show(String title, String message, {Function? onTapButton}) {
    showDialog(
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          MaterialButton(onPressed: () {
            Navigator.pop(context);

            if (onTapButton != null) {
              onTapButton();
            }

          }, child: const Text('Ok')),
        ],
        
      ), context: context,
    );
  }
}