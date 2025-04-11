import 'package:disenos_app/theme/theme.dart';
import 'package:disenos_app/widgets/shared/slide_show/slide_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShowsScreen extends StatelessWidget {
  const SlideShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLarge =
        MediaQuery.of(context).size.height > 500 ? true : false;

    final children = const [
      Expanded(child: _MySlideShow()),
      Expanded(child: _MySlideShow()),
    ];
    return Scaffold(body: isLarge ? Column(children: children) : Row(children: children) );
  }
}

class _MySlideShow extends StatelessWidget {
  const _MySlideShow();

  @override
  Widget build(BuildContext context) {
    final customThme = Provider.of<ThemeChangerModel>(context);
    return SlideShowWidget(
     bulltPrimary: 20,
     // dotTop: true,
     
     dotPrimaryColor: customThme.darkTheme() ? customThme.currentTheme().colorScheme.tertiary : Colors.red,
     slides: [
     SvgPicture.asset('assets/images/svgs/slides/slide-1.svg'),
     SvgPicture.asset('assets/images/svgs/slides/slide-2.svg'),
     SvgPicture.asset('assets/images/svgs/slides/slide-3.svg'),
     SvgPicture.asset('assets/images/svgs/slides/slide-4.svg')
    ],);
  }
}
