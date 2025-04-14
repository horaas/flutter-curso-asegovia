import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_left, size: 40),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.messenger_outline_sharp),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.headphones)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
    );
  }
}
