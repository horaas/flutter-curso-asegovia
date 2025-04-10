import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowsScreen extends StatelessWidget {

  const SlideShowsScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
            child: Column(
              children: [
                Expanded(child: _Slides()),
                _Dots()
              ],
            ),
           ),
       );
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle
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

