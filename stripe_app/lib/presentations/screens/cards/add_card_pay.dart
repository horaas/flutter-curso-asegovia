import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/presentations/widgets/total_pay_button.dart';
import 'package:stripe_app/services/stripe_service.dart';

class AddCardPay extends StatefulWidget {
  const AddCardPay({super.key});

  @override
  State<AddCardPay> createState() => _AddCardPayState();
}

class _AddCardPayState extends State<AddCardPay> {
  final controller = CardFormEditController();

  void update() => setState(() {});

  @override
  void initState() {
   controller.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(update);
    controller.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('prueba')),
      body: Stack(
        children: [
          Container(),
          Container(
            padding: const EdgeInsets.all(10),
            child: CardFormField(
              controller: controller,
              countryCode: 'US',
              style: CardFormStyle(
                borderColor: Colors.blueGrey,
                textColor: Colors.black,
                placeholderColor: Colors.blue,
              ),
            ),
          ),
          Positioned(
          bottom: 0,
          child: TotalPayButton(onPressed: () {
            print('hola');
          },) 
        )
        ],
      ),
    );
  }
 }

