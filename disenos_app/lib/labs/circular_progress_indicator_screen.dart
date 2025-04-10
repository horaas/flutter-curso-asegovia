import 'package:disenos_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorScreen extends StatelessWidget {

  const CircularProgressIndicatorScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: ProgressIndicatorWidget(),
       );
  }
}