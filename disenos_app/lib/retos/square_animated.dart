import 'package:flutter/material.dart';

class SquareAnimated extends StatefulWidget {
  const SquareAnimated({super.key});

  @override
  State<SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<SquareAnimated>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> moveToRight;
  late Animation<double> moveToTLeft;
  
  late Animation<double> moveToTop;
  late Animation<double> moveToTBottom;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );
    moveToRight = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.0, 0.25, curve: Curves.elasticOut)),
    );
    moveToTop = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.25, 0.50, curve: Curves.elasticOut)),
    );
    moveToTLeft = Tween(begin: 0.0, end: -150.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.50, 0.75, curve: Curves.elasticOut)),
    );
    moveToTBottom = Tween(begin: 0.0, end: 150.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.75, 1.0, curve: Curves.elasticOut)),
    );
    // TODO: implement initState
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
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.translate(offset: Offset(moveToRight.value + moveToTLeft.value, moveToTop.value+moveToTBottom.value), child:child);// Transform.translate(offset: Offset(150.0, moveToTop.value), child: child,),);
          },
          child: _Cuadrado(),
        ),
      ),
    );
  }
}

class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
