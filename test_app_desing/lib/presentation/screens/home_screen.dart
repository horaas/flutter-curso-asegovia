import 'package:flutter/material.dart';
import 'package:test_app_desing/helpers/data.dart';
import 'package:test_app_desing/presentation/widgets/custom_scroll.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _ContainerImagesView(),
          _BackgroundGradient(),
          _ContentFrontImage(),
          
          Positioned(
            top: size.height * 0.5,
            child: SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                 children: [
                  SizedBox(height: 25,),
                   CustomScroll(game: games2),
                  SizedBox(height: 10,),
                  _CoverImage(),
                  SizedBox(height: 10,),
                  CustomScroll(game: games),
                 ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: size.width,
      height: size.height * 0.12,
      child: Container(
        decoration: BoxDecoration(
      color: Colors.red,
      image: DecorationImage(image: NetworkImage(featuredGames[3].coverImage.url), fit: BoxFit.cover,)
      ),
      ),
    );
  }
}

class _ContentFrontImage extends StatelessWidget {
  const _ContentFrontImage();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 40),
      height: size.height * 0.5,
      child: Column(
        children: [
          _MenuActionBar(),
            Spacer(),
            _ContentTitleFeature(),
        ],
      ),
    );
  }
}

class _ContentTitleFeature extends StatelessWidget {
  const _ContentTitleFeature();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height *0.14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Total War: Three Kindoms',maxLines: 2, style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.040,
          ),),

          Expanded(child: _DotsTotal())
        ],
      ),
    );
  }
}

class _DotsTotal extends StatelessWidget {
  const _DotsTotal();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: featuredGames.map((element) => Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle
            ),
          ),
        )).toList(),
      ),
    );
  }
}

class _MenuActionBar extends StatelessWidget {
  const _MenuActionBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.menu, size: 35, color: Colors.white,)),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 35, color: Colors.white,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_sharp, size: 35, color: Colors.white,)),
      ],
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.65,
        // color: Colors.blue,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.65, 1.0],
            colors: [
            Color.fromRGBO(35, 45, 59, 1.0),
            Colors.transparent
          ])
        ),
      ),
    );
  }
}

class _ContainerImagesView extends StatelessWidget {
  const _ContainerImagesView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      
      height: size.height * 0.70,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((element) => _ContentPageViewItem(element.coverImage.url)).toList(),
      ),
      
    );
  }
}

class _ContentPageViewItem extends StatelessWidget {
  final String url;
  const _ContentPageViewItem(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(url),
        ),
      ),
    );
  }
}
