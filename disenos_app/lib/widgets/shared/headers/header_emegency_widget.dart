import 'package:flutter/material.dart';

class HeaderEmegencyWidget extends StatelessWidget {

  const HeaderEmegencyWidget({ super.key });

   @override
   Widget build(BuildContext context) {
       return _IconHeader();
  }
}

class _IconHeader extends StatelessWidget {
  const _IconHeader();

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff526Bf6),
        Color(0xff67ACF2),
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