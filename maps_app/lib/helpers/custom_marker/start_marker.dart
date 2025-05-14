import 'package:flutter/material.dart';

class StartMarker extends CustomPainter {

  final int minutes;
  final String destination;

  StartMarker({required this.minutes, required this.destination});
  @override
  void paint(Canvas canvas, Size size) {
    final double circleRadius = 20;
    final double circleRadiusWhite = 7;
    final pencil = Paint()..color = Colors.black;
    final pencilWhite = Paint()..color = Colors.white;

    Offset center = Offset(circleRadius, size.height - circleRadius);
    Offset centerWhite = Offset(circleRadius, size.height - circleRadius);

    canvas.drawCircle(center, circleRadius, pencil);
    canvas.drawCircle(centerWhite, circleRadiusWhite, pencilWhite);

    // dibujar path
    final path = Path();
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20.0);
    path.lineTo(size.width - 10, 100.0);
    path.lineTo(40, 100.0);
    canvas.drawShadow(path, Colors.black, 10, false);
    canvas.drawPath(path, pencilWhite);

    // caja negra

    const blacBox = Rect.fromLTWH(40, 20, 70, 80);

    canvas.drawRect(blacBox, pencil);

    // textos
    final textSpan = TextSpan(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
      text: '$minutes',
    );

    final minustsPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);
    minustsPainter.paint(canvas, const Offset(40, 35));

    //minutos

    final minutesText = const TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      text: 'Min',
    );

    final minutMinPainter = TextPainter(
      text: minutesText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);
    minutMinPainter.paint(canvas, const Offset(40, 70));

    //description

    final locationText = TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      text: destination,
    );

    final locationPainter = TextPainter(
      maxLines: 2,
      ellipsis: '...',
      text: locationText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(minWidth: size.width - 135, maxWidth: size.width - 135);

    final double offsetY = destination.length > 20 ? 40 : 50;

    locationPainter.paint(canvas, Offset(120, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
