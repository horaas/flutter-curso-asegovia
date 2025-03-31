import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/compass/compass.provider.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/screens/permissions/ask_location_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permisions = ref.watch(permissionsProvider);

    final compass = ref.watch(compassProvider);

    if (!permisions.location.isGranted) {
      return const AskLocationScreen();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('ZSXadsad')),
      backgroundColor: Colors.black,
      body: Center(
        child: compass.when(
          data: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${data?.ceil()}', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 50),
                Compass(heading: data ?? 0),
              ],
            );
          },
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class Compass extends StatefulWidget {
  final double heading;
  const Compass({super.key, required this.heading});

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {
    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction) : direction;

    double diff = direction - prevValue;
    if (diff.abs() > 180) {
      if (prevValue > direction) {
        diff = 360 - (direction - prevValue).abs();
      } else {
        diff = 360 - (prevValue - direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset('assets/images/compass/quadrant-4.png'),
          // Transform.rotate(
          //   angle: (compass * (pi / 180) * -1),
          //   child: Image.asset('assets/images/compass/needle-7.png'),
          //   )
          AnimatedRotation(
            curve: Curves.easeInOut,
            turns: getTurns(),
            duration: const Duration(microseconds: 100),
            child: Image.asset('assets/images/compass/needle-7.png'),
          ),
        ],
      ),
    );
  }
}
