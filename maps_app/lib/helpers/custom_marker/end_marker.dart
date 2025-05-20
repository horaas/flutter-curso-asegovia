import 'package:flutter/material.dart';

class EndMarker extends CustomPainter {

  final int kilometer;
  final String destination;

  EndMarker({required this.kilometer, required this.destination});
  @override
  void paint(Canvas canvas, Size size) {
    final double circleRadius = 10;
    final double circleRadiusWhite = 5;
    final pencil = Paint()..color = Colors.black;
    final pencilWhite = Paint()..color = Colors.white;

    Offset center = Offset(size.width * 0.5, size.height * 0.85);
    Offset centerWhite = Offset(size.width * 0.5, size.height * 0.85);

    canvas.drawCircle(center, circleRadius, pencil);
    canvas.drawCircle(centerWhite, circleRadiusWhite, pencilWhite);

    // dibujar path
    final path = Path();
    path.moveTo(size.width * 0.04, size.height * 0.1);
    path.lineTo(size.width * 0.96, size.height * 0.1);
    path.lineTo(size.width * 0.96, size.height * 0.7);
    path.lineTo(size.width * 0.04, size.height * 0.7);
    canvas.drawShadow(path, Colors.black, size.width * 0.025, false);
    canvas.drawPath(path, pencilWhite);

    // // caja negra

    Rect blacBox = Rect.fromLTWH(size.width * 0.04, size.height * 0.1, size.width * 0.25, size.height * 0.6);

    canvas.drawRect(blacBox, pencil);

    // textos
    final textSpan = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: size.width * 0.085,
        fontWeight: FontWeight.w400,
      ),
      text: '$kilometer',
    );

    final minustsPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: size.width * 0.25, maxWidth: size.width * 0.6);

    minustsPainter.paint(canvas, Offset(size.width * 0.045, size.height * 0.18));

    // //minutos

    final minutesText = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: size.width * 0.055,
        fontWeight: FontWeight.w400,
      ),
      text: 'Kms',
    );

    final minutMinPainter = TextPainter(
      text: minutesText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: size.width * 0.25, maxWidth: size.width * 0.6);
    minutMinPainter.paint(canvas, Offset(size.width * 0.045, size.height * 0.4));

    // //description

    final locationText = TextSpan(
      style: TextStyle(
        color: Colors.black,
        fontSize:  size.width * 0.055,
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
    )..layout(minWidth: size.width * 0.25, maxWidth: size.width * 0.65);

    final double offsetY = destination.length > 20 ? size.height * 0.25 : size.height * 0.32;

    locationPainter.paint(canvas, Offset(size.width * 0.32, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
