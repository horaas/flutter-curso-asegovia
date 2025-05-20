import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/presentations/screens/screens.dart';
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
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);
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
          child: TotalPayButton(onPressed: () async {
            showLoading(context);
            final responseProcessPayment = await StripeService().paymentWithNewcard(amount: paymentBloc.state.paymentAmountString, currency: paymentBloc.state.currency);

            if (context.mounted) {
              Navigator.of(context).pop();
              if (responseProcessPayment.ok) {
                Navigator.push(context, navigateFadein(context, const PaymentSuccesfull())); 
              } else {
                showAlert(context, 'Error', 'mesanje de error');
              }
            }
          },) 
        )
        ],
      ),
    );
  }
 }

