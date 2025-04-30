import 'package:flutter/material.dart';

class ShowALert {
  final BuildContext context;

  ShowALert({required this.context});

  show(String title, String message) {
    showDialog(
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          MaterialButton(onPressed: () {
            Navigator.pop(context);

          }, child: const Text('Ok')),
        ],
        
      ), context: context,
    );
  }
}