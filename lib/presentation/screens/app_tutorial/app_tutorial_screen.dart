import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SliedInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SliedInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SliedInfo>{
  SliedInfo('Busca la comiuda', 'caption', 'assets/images/1.jpg'),
  SliedInfo(
      'Entrega Rapida', 'caption sdfsd dsfsd fdsf sdf', 'assets/images/2.jpg'),
  SliedInfo(
      'ya mismo', 'captionsdfsd dsfdsf dsf sdf dsf ds ', 'assets/images/3.jpg'),
};

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final controllerPageView = PageController();
  bool endSlide = false;

  @override
  void initState() {
    super.initState();

    controllerPageView.addListener(
      () {
        final page = controllerPageView.page ?? 0;

        if(!endSlide && page >= (slides.length -1.5)) {
          setState(() {
            endSlide = true;
          });
        }
        
        if(endSlide && page < (slides.length -1.5)) {
          setState(() {
            endSlide = false;
          });
        }
      },
    );
  }

@override
  void dispose() {
    controllerPageView.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controllerPageView,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideDAta) => _Slide(
                    title: slideDAta.title,
                    caption: slideDAta.caption,
                    imageUrl: slideDAta.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  child: const Text('Salir'), onPressed: () => context.pop())),
          endSlide
              ? Positioned(
                  right: 20,
                  bottom: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 200),
                    child: FilledButton(
                        child: const Text('Comenzar'),
                        onPressed: () => context.pop()
                    ),
                  )
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStye = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStye,
            ),
          ],
        ),
      ),
    );
  }
}
