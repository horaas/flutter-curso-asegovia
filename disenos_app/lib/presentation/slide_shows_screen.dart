import 'package:disenos_app/widgets/shared/slide_show/slide_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowsScreen extends StatelessWidget {

  const SlideShowsScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: SlideShowWidget(
            bulltPrimary: 5,
            // dotTop: true,
            dotPrimaryColor: Colors.red,
            slides: [
            SvgPicture.asset('assets/images/svgs/slides/slide-1.svg'),
            SvgPicture.asset('assets/images/svgs/slides/slide-2.svg'),
            SvgPicture.asset('assets/images/svgs/slides/slide-3.svg'),
            SvgPicture.asset('assets/images/svgs/slides/slide-4.svg')
           ],),
       );
  }
}