import 'package:disenos_app/widgets/shared/headers/header_emegency_widget.dart';
import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {

  const EmergencyScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: HeaderEmegencyWidget(),
       );
  }
}