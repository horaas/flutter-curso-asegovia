import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void showLoading (BuildContext context) {
  showDialog(context: context, 
  barrierDismissible: false,
  builder: (context) => AlertDialog(
    title: const Text('Espere...'),
    content: Container(
      margin: const EdgeInsets.only(top: 10),
      width: 50,
      height: 50,
      child: const Column(
         children: [
          CircularProgressIndicator(strokeWidth: 5,)
         ],
      ),
    ),
  ),);
}