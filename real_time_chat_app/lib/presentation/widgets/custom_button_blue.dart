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
      height: MediaQuery.of(context).size.width * 0.12,
      child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.04),))));
  }
}
