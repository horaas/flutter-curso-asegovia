import 'package:flutter/material.dart';

class HeaderSquare extends StatelessWidget {
  const HeaderSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xFF5E87DF),
      width: double.infinity,
    );
  }
}

class HeaderBorder extends StatelessWidget {
  const HeaderBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF5E87DF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _HeaderDiagonalCustom(), child: Container());
  }
}

class _HeaderDiagonalCustom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.26);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangleHeader extends StatefulWidget {
  const TriangleHeader({super.key});

  @override
  State<TriangleHeader> createState() => _TriangleHeaderState();
}

class _TriangleHeaderState extends State<TriangleHeader> {
  int typeHeader = 1;
  getTriangle([int type = 1]) {
    switch (type) {
      case 1:
        return _TriangleHeaderCustom1();
      case 2:
        return _TriangleHeaderCustom2();
      case 3:
        return _TriangleHeaderCustom3();
      case 4:
        return _TriangleHeaderCustom4();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(painter: getTriangle(typeHeader), child: Container()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                typeHeader = 1;
              });
            },
            heroTag: 0,
            child: CustomPaint(
              painter: _TriangleHeaderCustom1(),
              child: SizedBox(height: 40, width: 40),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                typeHeader = 2;
              });
            },
            heroTag: 0,
            child: CustomPaint(
              painter: _TriangleHeaderCustom2(),
              child: SizedBox(height: 40, width: 40),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                typeHeader = 3;
              });
            },
            heroTag: 0,
            child: CustomPaint(
              painter: _TriangleHeaderCustom3(),
              child: SizedBox(height: 40, width: 40),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                typeHeader = 4;
              });
            },
            heroTag: 0,
            child: CustomPaint(
              painter: _TriangleHeaderCustom4(),
              child: SizedBox(height: 40, width: 40),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _TriangleHeaderCustom1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _TriangleHeaderCustom2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(0.0, 0.0);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _TriangleHeaderCustom3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 2;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _TriangleHeaderCustom4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(size.width, 0.0);

    path.lineTo(size.width, size.height);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0.0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _HeaderPicoCustom(), child: Container());
  }
}

class _HeaderPicoCustom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _HeaderCurvoCustom(), child: Container());
  }
}

class _HeaderCurvoCustom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.40,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _HeaderWavesCustom(), child: Container());
  }
}

class _HeaderWavesCustom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    pencil.color = Color(0xFF5E87DF);
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.25,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.15,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWavesGradient extends StatelessWidget {
  const HeaderWavesGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeaderWavesGradientCustom(),
      child: Container(),
    );
  }
}

class _HeaderWavesGradientCustom extends CustomPainter {
  final rect = Rect.fromCircle(center: Offset(0.0, 150.0), radius: 90);
  final gradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xFF2869F7), Color(0xFF97B0E5), Color(0xFFFFFFFF)],
  );

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    // pencil.color = Color(0xFF5E87DF);
    pencil.shader = gradientColor.createShader(rect);
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.25,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.15,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
