import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverApp'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/permissions');
            },
            icon: Icon(Icons.content_paste_off_outlined),
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
