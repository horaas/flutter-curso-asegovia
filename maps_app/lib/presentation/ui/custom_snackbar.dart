import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {

  final String message;

  CustomSnackbar({super.key,
  required this.message,
  String labelButton = 'Ok',
  Duration duration = const Duration(seconds: 2),
  VoidCallback? onOk,
  }): super(
    content: Text(message),
    duration: duration,
    action: SnackBarAction(label: labelButton, onPressed: () {
      if (onOk == null) return;

      onOk();
    })
    
    );
}