import 'package:flutter/material.dart';

class CustomAppbarWiget extends StatelessWidget {
  final String title;

  const CustomAppbarWiget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 30, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              const Icon(Icons.search, size: 30, color: Colors.black),
              const SizedBox(width: 25),
            ],
          ),
        ),
      ),
    );
  }
}
