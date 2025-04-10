import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonIconItemWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final IconData icon;
  final Color gradientPrimary;
  final Color gradientSecondary;



  const ButtonIconItemWidget({super.key, required this.text, required this.onTap, this.icon = FontAwesomeIcons.star, this.gradientPrimary = const Color(0xFF6989F5), this.gradientSecondary = const Color(0xFF906EF5)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          _ButtonBackground(gradientPrimary: gradientPrimary, gradientSecondary: gradientSecondary, icon: icon),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40,),
              FaIcon(icon, size: 40, color: Colors.white,),
              const SizedBox(width: 20,),
              Expanded(
                child: Text(text, style: const TextStyle(
                  color: Colors.white,
                ),),
              ),
              const FaIcon(FontAwesomeIcons.chevronRight, size: 40, color: Colors.white,),
              const SizedBox(width: 40,),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonBackground extends StatelessWidget {
  
  final Color gradientPrimary;
  final Color gradientSecondary;
  final IconData icon;
  const _ButtonBackground({required this.gradientPrimary, required this.gradientSecondary, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.red,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), offset: const Offset(4, 6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          gradientPrimary,
          gradientSecondary
        ])
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15) ,
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withValues(alpha: 0.2),)
            )
          ],
        ),
      ),
    );
  }
}
