import 'package:flutter/material.dart';
import 'dart:math' show pi;


class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CuadradoAnimado()));
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
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> moverInit;
  late Animation<double> agrandar;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );
    rotation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    );
    opacidad = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0, 0.50, curve: Curves.easeOut))
    );
    // opacidadOut = Tween(begin: 1.0, end: 0.0).animate(
    //   CurvedAnimation(parent: animationController, curve: const Interval(0.75, 1.0, curve: Curves.easeOut))
    // );
    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.75, 1.0, curve: Curves.easeOut))
    );
    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    );
    moverInit = Tween(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
    );
    agrandar = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut)
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
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
              scale: agrandar.value,
              child: child),)),
        );
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
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
