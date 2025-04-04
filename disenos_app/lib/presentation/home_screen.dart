import 'package:disenos_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: HeaderWavesGradient(),
       );
  }
}