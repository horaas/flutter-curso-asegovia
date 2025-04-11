import 'package:flutter/material.dart';
// import 'package:disenos_app/presentation/animations_screen.dart';
// import 'package:disenos_app/labs/circular_progress_indicator_screen.dart';
// import 'package:disenos_app/presentation/graficars_circulares_screen.dart';
// import 'package:disenos_app/presentation/slide_shows_screen.dart';
// import 'package:disenos_app/retos/square_animated.dart';
// import 'package:disenos_app/widgets/widgets.dart';
// import 'package:disenos_app/presentation/pinterest_screen.dart';
// import 'package:disenos_app/presentation/emergency_screen.dart';
import 'package:disenos_app/presentation/slivers_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return const Scaffold(
           body: SliversScreen(),
       );
  }
}