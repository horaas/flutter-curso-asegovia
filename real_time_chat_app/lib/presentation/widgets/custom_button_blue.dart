import 'package:flutter/material.dart';

class CustomButtonBlue extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const CustomButtonBlue({
    super.key, this.onPressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(2),
        backgroundColor: onPressed != null ? const WidgetStatePropertyAll(Colors.blueAccent) : null,
        
        // textStyle: WidgetStatePropertyAll(TextStyle(color: ))
      ),
      onPressed: onPressed, child: SizedBox(
      width: double.infinity,
      height: 55,
      child: Center(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 17),))));
  }
}
