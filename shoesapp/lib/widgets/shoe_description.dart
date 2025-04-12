import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title; 
  final String description; 
  const ShoeDescription({ super.key, required this.title, required this.description });

   @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(fontSize: 17, color: Colors.grey),
          ),
        ],
      ),
    );
  }

}