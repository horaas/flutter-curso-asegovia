import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentSuccesfull extends StatelessWidget {

  const PaymentSuccesfull({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Pago realizado'),),
           body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.star, color: Colors.white54, size: 100,),
                Text('Pago finalizado', style: TextStyle(
                  color: Colors.white54, fontSize: 40
                ),)
              ],
            ),
           ),
       );
  }
}