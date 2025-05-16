import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class AddCardPay extends StatelessWidget {
  const AddCardPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('prueba')),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: CardFormField(
          // controller: controller,
          countryCode: 'US',
          style: CardFormStyle(
            borderColor: Colors.blueGrey,
            textColor: Colors.black,
            placeholderColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
