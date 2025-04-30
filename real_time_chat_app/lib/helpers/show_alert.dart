import 'package:flutter/material.dart';
import 'package:real_time_chat_app/presentation/widgets/dialog_custom.dart';

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