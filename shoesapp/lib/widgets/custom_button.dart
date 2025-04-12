import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xFFFF9e00)),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 35, vertical: 12),
        ),
      ),
      child: const Text(
        'Add to cart',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
