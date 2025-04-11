import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Animate_Do'),
        actions: [
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.twitter)),
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.chevronRight),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.newspaper, color: Colors.lightBlue, size: 30),
            Text(
              'Titulo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
            Text(
              'trext mas corto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Container(width: 200, height: 2, color: Colors.lightBlue),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.play, color: Colors.white),
      ),
    );
  }
}
