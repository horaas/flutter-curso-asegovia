import 'package:disenos_app/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShowsScreen extends StatelessWidget {

  const SlideShowsScreen({ super.key });

   @override
   Widget build(BuildContext context) {


       return ChangeNotifierProvider(
        create: (context) => SliderModel(),
         child: Scaffold(
             body: Center(
              child: Column(
                children: [
                  Expanded(child: _Slides()),
                  _Dots()
                ],
              ),
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
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewCurrent = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.slowMiddle,
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: (pageViewCurrent >= index - 0.5 && pageViewCurrent < index + 0.5 )? Colors.blue : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides();

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      print('pagina actual ${pageController.page}');
      Provider.of<SliderModel>(context, listen: false).currentPage = pageController.page!;
    },);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
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

