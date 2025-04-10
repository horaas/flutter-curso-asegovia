import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShowWidget extends StatelessWidget {

  final List<Widget> slides;
  final bool dotTop;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  final double bulltPrimary;
  final double bulltSecondary;

  const SlideShowWidget({ super.key, required this.slides, this.dotTop = false, this.dotPrimaryColor = Colors.blue, this.dotSecondaryColor = Colors.grey, this.bulltPrimary = 12.0, this.bulltSecondary = 12.0 });

   @override
   Widget build(BuildContext context) {


       return ChangeNotifierProvider(
        create: (_) => _SliderModel(),
         child: SafeArea(
           child: Center(
              child: Builder(
                builder: (context) {
                  Provider.of<_SliderModel>(context).dotPrimaryColor = dotPrimaryColor;
                  Provider.of<_SliderModel>(context).dotSecondaryColor = dotSecondaryColor;
                  Provider.of<_SliderModel>(context).bulltPrimary = bulltPrimary;
                  Provider.of<_SliderModel>(context).bulltSecondary = bulltSecondary;
                  return _CreateSlideBuilder(dotTop: dotTop, slides: slides);
                }
              ),
            ),
         ),
       );
  }
}

class _CreateSlideBuilder extends StatelessWidget {
  const _CreateSlideBuilder({
    required this.dotTop,
    required this.slides,
  });

  final bool dotTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(dotTop) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if(!dotTop) _Dots(slides.length)
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int countDots;

  const _Dots(this.countDots);

  //generado por mi para la solcuon de la tarea
  List<Widget> getCountDots(int count) {
    List<Widget> dots = [];

    for (var i = 0; i < count; i++) {
      dots.add(_Dot(i));
    }
    return dots;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(countDots, (index) => _Dot(index),)
        //  getCountDots(countDots),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    // final pageViewCurrent = Provider.of<_SliderModel>(context).currentPage;
    final slideShowModel = Provider.of<_SliderModel>(context);
    double tamano;
    Color color;

    if ((slideShowModel.currentPage >= index - 0.5 && slideShowModel.currentPage < index + 0.5 )) {
      
      tamano = slideShowModel.bulltPrimary;
      color = slideShowModel.dotPrimaryColor;
    } else {
      tamano = slideShowModel.bulltSecondary;
      color = slideShowModel.dotSecondaryColor;
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        // shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10)
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
      Provider.of<_SliderModel>(context, listen: false).currentPage = pageController.page!;
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



class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _dotPrimaryColor = Colors.blue;
  Color _dotSecondaryColor = Colors.grey;
  double _bulltPrimary = 12.0;
  double _bulltSecondary = 12.0;


  double get currentPage => _currentPage;
  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get dotPrimaryColor => _dotPrimaryColor;
  set dotPrimaryColor(Color color) {
    _dotPrimaryColor = color;
    // notifyListeners();
  }

  Color get dotSecondaryColor => _dotSecondaryColor;
  set dotSecondaryColor(Color color) {
    _dotSecondaryColor = color;
    // notifyListeners();
  }

  double get bulltPrimary => _bulltPrimary;
  set bulltPrimary(double bullet) {
    _bulltPrimary = bullet;
    // notifyListeners();
  }

  double get bulltSecondary => _bulltSecondary;
  set bulltSecondary(double bullet) {
    _bulltSecondary = bullet;
    // notifyListeners();
  }

}
