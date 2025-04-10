import 'dart:async';

import 'package:disenos_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GraficarsCircularesScreen extends StatefulWidget {
  const GraficarsCircularesScreen({super.key});

  @override
  State<GraficarsCircularesScreen> createState() =>
      _GraficarsCircularesScreenState();
}

class _GraficarsCircularesScreenState extends State<GraficarsCircularesScreen> {
  double porcentage = 0.0;    
  Timer? timer;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: porcentage != 0 ? null : () {
          if (timer != null && timer!.isActive) {
            timer!.cancel();
          }

          porcentage = porcentage + 10;
          setState(() {});
          timer = Timer.periodic(const Duration(milliseconds: 200),(timer) {
            porcentage = porcentage + 10;
            if (porcentage == 120) {
              porcentage = 0;
              porcentage = 0;
              timer.cancel();
            }
            setState(() {});
          },);


        },
        child: porcentage == 0 ? const Icon(Icons.play_arrow) : _CustomRadialProgress(porcentage: porcentage,color: Colors.indigo, strokeWidthPrimary: 5,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _CustomRadialProgress(porcentage: porcentage,color: Colors.red),
              _CustomRadialProgress(porcentage: porcentage,color: Colors.green)
            ],
          ),
          _CustomRadialProgress(porcentage: porcentage,color: Colors.blue),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _CustomRadialProgress(porcentage: porcentage,color: Colors.yellow),
              _CustomRadialProgress(porcentage: porcentage,color: Colors.pink)
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomRadialProgress extends StatelessWidget {
  final double porcentage;
  final Color color;
  
  final double strokeWidthPrimary;

  const _CustomRadialProgress({
    required this.porcentage, required this.color, this.strokeWidthPrimary = 8.0,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: RadialPorgressWidget(procentaje: porcentage, primaryColor: color, strokeWidthPrimary: strokeWidthPrimary),
    );
  }
}
