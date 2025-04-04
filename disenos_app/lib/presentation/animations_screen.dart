import 'package:flutter/material.dart';
import 'dart:math' show pi;


class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CuadradoAnimado()));
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> rotation;
  late Animation<double> opacidad;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    rotation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    );
    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0, 0.50, curve: Curves.easeOut))
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        // animationController.reverse();
        // animationController.reset();
      }
    },);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (context, child) {
        return Transform.rotate(
          angle: rotation.value,
          child: Opacity(opacity: opacidad.value, child: child,));
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
