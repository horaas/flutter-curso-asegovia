import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  State<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> with SingleTickerProviderStateMixin {
  double porcentage = 0.0;
  double porcentageNew = 0.0;
  late AnimationController controller;



  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    controller.addListener(
      () {
        setState(() {
          
          porcentage = lerpDouble(porcentage, porcentageNew, controller.value)!;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              width: 300,
              height: 300,
              // color: Colors.red,
              child: CustomPaint(painter: _MyRadialCustomPainter(porcentage)),
            ),
          ),
          Center(child: Text('$porcentageNew%', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentage = porcentageNew;
          porcentageNew =  porcentage + 1;
          if (porcentageNew == 110) {
            porcentageNew = 0;
            porcentage = 0;
          }

          controller.forward(from: 0);
          setState(() {});
        },
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.plus_one_outlined),
            Icon(Icons.exposure_zero_sharp),
          ],
        ),
      ),
    );
  }
}

class _MyRadialCustomPainter extends CustomPainter {
  final double porcentage;

  _MyRadialCustomPainter(this.porcentage);

  @override
  void paint(Canvas canvas, Size size) {
    final pencil =
        Paint()
          ..strokeWidth = 5
          ..color = Colors.grey
          ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);

    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, pencil);

    final pencilArco =
        Paint()
          ..strokeWidth = 10
          ..color = Colors.pink
          ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (porcentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      (-pi / 2),
      arcAngle,
      false,
      pencilArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
