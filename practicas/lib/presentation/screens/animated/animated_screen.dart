import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  const AnimatedScreen({ super.key });

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  double border = 10;
  Color color = Colors.blueAccent;


  void changeAniamted() {
    final random = Random();
    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    border = random.nextInt(50) + 10;
    color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    setState(() {
      
    });
  }


   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('animation'),),
           body: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.elasticIn,
              width: width <= 0 ? 0 : width,
              height: height <= 0 ? 0 : height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(border < 0 ? 0 : border)
              ),
            ),
           ),
           floatingActionButton: FloatingActionButton(
            onPressed: changeAniamted,
            child: const Icon(
              Icons.play_arrow
            ),
           ),
       );
  }
}