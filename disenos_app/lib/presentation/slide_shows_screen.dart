import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowsScreen extends StatelessWidget {

  const SlideShowsScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
            child: _Slides(),
           ),
       );
  }
}

class _Slides extends StatelessWidget {
  const _Slides();

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        _Slide('assets/images/svgs/slides/slide-1.svg'),
        _Slide('assets/images/svgs/slides/slide-2.svg'),
        _Slide('assets/images/svgs/slides/slide-3.svg'),
      ],
    );
    
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg));
  }
}

