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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentage = porcentage + 10;
          if (porcentage == 110) {
            porcentage = 0;
            porcentage = 0;
          }
          setState(() {});
        },
        child: const Icon(Icons.plus_one_outlined),
      ),
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: RadialPorgressWidget(procentaje: porcentage),
        ),
      ),
    );
  }
}
