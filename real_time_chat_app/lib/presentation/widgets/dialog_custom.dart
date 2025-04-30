import 'package:flutter/material.dart';

class DialogCustom extends StatelessWidget {

  const DialogCustom({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Container(
            width: 150,
            height: 150,
            color: Colors.red,
            child: Text('gola')
           ),
       );
  }
}