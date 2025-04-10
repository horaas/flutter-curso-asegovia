import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHaderWidget extends StatelessWidget {
  final Color gradientPrimary;
  final Color gradientSecondary;
  final String title;
  final String subTitle;
  final IconData icon;

  const IconHaderWidget({super.key, this.gradientPrimary = const Color(0xff526Bf6), this.gradientSecondary = const Color(0xff67ACF2), required this.title, required this.subTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    final whiteColor = Colors.white.withValues(alpha: 0.7);
    return Stack(
      children: [
        _IconHeaderBacground([gradientPrimary, gradientSecondary]),
        Positioned(
          top: -70,
          left: -70,
          child: FaIcon(icon, size: 250, color: Colors.white.withAlpha(25),)
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80, width: double.infinity,),
            Text(title, style: TextStyle(fontSize: 20, color: whiteColor),),
            const SizedBox(height: 20,),
            Text(subTitle, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: whiteColor),),
            FaIcon(icon, size: 75, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBacground extends StatelessWidget {
  final List<Color> colors;

  const _IconHeaderBacground(this.colors);


  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        colors[0],
        colors[1],
      ]
    );

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: gradient
      ),
    );
  }
}