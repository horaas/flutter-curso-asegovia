import 'package:disenos_app/widgets/shared/headers/icon_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IconHaderWidget(
        title: 'Haz solitado',
        subTitle: 'Asistencia Médica',
        icon: FontAwesomeIcons.plus,
      ),
    );
  }
}
