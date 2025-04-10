import 'package:disenos_app/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShowWidget extends StatelessWidget {

  final List<Widget> slides;
  final bool dotTop;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;

  const SlideShowWidget({ super.key, required this.slides, this.dotTop = false, this.dotPrimaryColor = Colors.blue, this.dotSecondaryColor = Colors.grey });

   @override
   Widget build(BuildContext context) {
       return ChangeNotifierProvider(
        create: (context) => SliderModel(),
         child: Center(
              child: Column(
                children: [
                  if(dotTop) _Dots(slides.length, dotPrimaryColor, dotSecondaryColor),
                  Expanded(child: _Slides(slides)),
                  if(!dotTop) _Dots(slides.length, dotPrimaryColor, dotSecondaryColor)
                ],
              ),
             ),
       );
  }
}

class _Dots extends StatelessWidget {
  final int countDots;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;

  const _Dots(this.countDots, this.dotPrimaryColor, this.dotSecondaryColor);

  //generado por mi para la solcuon de la tarea
  List<Widget> getCountDots(int count) {
    List<Widget> dots = [];

    for (var i = 0; i < count; i++) {
      dots.add(_Dot(i, dotPrimaryColor, dotSecondaryColor));
    }
    return dots;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(countDots, (index) => _Dot(index, dotPrimaryColor, dotSecondaryColor),)
        //  getCountDots(countDots),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;

  const _Dot(this.index, this.dotPrimaryColor, this.dotSecondaryColor);

  @override
  Widget build(BuildContext context) {

    final pageViewCurrent = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.slowMiddle,
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: (pageViewCurrent >= index - 0.5 && pageViewCurrent < index + 0.5 )? dotPrimaryColor : dotSecondaryColor,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
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
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
    // return PageView.builder(
    //   itemCount: widget.slides.length,
    //   itemBuilder: (context, index) => _Slide(widget.slides[index]),
    //   controller: pageController,
    // );
    
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide);
  }
}

