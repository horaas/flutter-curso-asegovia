import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color color;
  final double height;

  const CustomButton({
    super.key, required this.text, this.onTap, this.color = const Color(0xFFFF9e00), this.height = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 17, vertical: height),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//  ElevatedButton(
//               onPressed: () {},
//               style: ButtonStyle(
//                 backgroundColor: WidgetStatePropertyAll(Color(0xFFFFCA86)),
//                 padding: WidgetStatePropertyAll(
//                   EdgeInsets.symmetric(horizontal: 25, vertical: 5),
//                 ),
//               ),
//               child: const Text(
//                 'More related item',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),