import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GiroscopeBallScreen extends ConsumerWidget {
  const GiroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope = ref.watch(gyroscoperProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio')),
      body: SizedBox.expand(
        child: gyroscope.when(
          data: (data) => _ContainerBAll(x: data.x, y: data.y),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _ContainerBAll extends StatelessWidget {
  final double x;
  final double y;
  const _ContainerBAll({required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double heigth = size.height;
    double currentYPos = (y * 200);
    double currentxPos = (x * 200);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        AnimatedPositioned(
          left: (currentYPos - 25) + (width / 2),
          top: (currentxPos - 25) + (heigth / 2),
          curve: Curves.easeInOut,
          duration: Duration(microseconds: 1000),
          child: _Ball(),
        ),
        Text('''
      x: $x
      y: $y
''', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _Ball extends StatelessWidget {
  const _Ball();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
