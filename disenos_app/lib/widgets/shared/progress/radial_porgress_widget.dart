import 'dart:math';

import 'package:flutter/material.dart';

class RadialPorgressWidget extends StatefulWidget {
  final double procentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double strokeWidthPrimary;

  const RadialPorgressWidget({super.key, required this.procentaje, this.primaryColor = Colors.blue, this.secondaryColor = Colors.grey, this.strokeWidthPrimary = 8.0});

  @override
  State<RadialPorgressWidget> createState() => _RadialPorgressWidgetState();
}

class _RadialPorgressWidgetState extends State<RadialPorgressWidget> with SingleTickerProviderStateMixin {


  late AnimationController controller;
  late double porcentagePreview;

  @override
  void initState() {
    porcentagePreview = widget.procentaje;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
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

    controller.forward(from: 0.0);
    final animatedDif = widget.procentaje - porcentagePreview;
    porcentagePreview = widget.procentaje;

    return AnimatedBuilder(animation: controller, builder: (context, child) {
      return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialCustomPainter((widget.procentaje - animatedDif) + (animatedDif * controller.value), widget.primaryColor, widget.secondaryColor, widget.strokeWidthPrimary)
          ),
        );
    },);
    
    
  }
}

class _MyRadialCustomPainter extends CustomPainter {
  final double porcentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double strokeWidthPrimary;

  _MyRadialCustomPainter(this.porcentage, this.primaryColor, this.secondaryColor, this.strokeWidthPrimary);

  @override
  void paint(Canvas canvas, Size size) {
    final pencil =
        Paint()
          ..strokeWidth = 5
          ..color = secondaryColor
          ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);

    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, pencil);

    final pencilArco =
        Paint()
          ..strokeWidth = strokeWidthPrimary
          ..color = primaryColor
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

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
