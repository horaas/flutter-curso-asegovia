import 'package:flutter/material.dart';

class LabelsCustom extends StatelessWidget {
  final String title;
  final String route;
  final String text;

  const LabelsCustom({super.key, required this.route, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black54, fontSize: 15),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
      ],
    );
  }
}
