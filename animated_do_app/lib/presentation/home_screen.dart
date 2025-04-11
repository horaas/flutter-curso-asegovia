import 'package:animate_do/animate_do.dart';
import 'package:animated_do_app/presentation/twitter_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Animate_Do'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TwitterScreen(),));
          }, icon: FaIcon(FontAwesomeIcons.twitter)),
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.chevronRight),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1500),
              child: Icon(
                FontAwesomeIcons.newspaper,
                color: Colors.lightBlue,
                size: 30,
              ),
            ),
            FadeInDown(
              duration: Duration(milliseconds: 300),
              child: Text(
                'Titulo',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 700),
              child: Text(
                'trext mas corto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 900),
              child: Container(width: 200, height: 2, color: Colors.lightBlue),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.play, color: Colors.white),
      ),
    );
  }
}
