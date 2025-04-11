import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({super.key});

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  bool animate = false;
  double sizeIcon = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: ZoomOut(
          from: 5,
          animate: animate,
          duration: Duration(seconds: 1),
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: sizeIcon,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){
          setState(() {
            if (animate) {
              sizeIcon = 40;
            } else {
              sizeIcon = 200;
            }
            animate = !animate;
          });
        }, child: FaIcon(FontAwesomeIcons.play, color: Colors.white,),),
    );
  }
}
