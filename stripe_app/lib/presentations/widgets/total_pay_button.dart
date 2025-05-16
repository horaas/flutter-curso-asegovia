import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/blocs/blocs.dart';

class TotalPayButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const TotalPayButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final paymentBloc = BlocProvider.of<PaymentBloc>(context);
    return Container(
      width: width,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('${paymentBloc.state.amountPayment.toStringAsFixed(2)} ${paymentBloc.state.currency}', style: TextStyle(fontSize: 20)),
            ],
          ),
          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return _BtnPay(state: state, onPressed: onPressed,);
            }),
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  final PaymentState state;
  final VoidCallback? onPressed;

  const _BtnPay({required this.state, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return state.cardActive || state.isManualProcess ? _buildCreditCardButton(context) : _buildPayButton(context);
  }
  
  _buildPayButton(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.black,
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            Platform.isAndroid ? FontAwesomeIcons.googlePay : FontAwesomeIcons.applePay,
            color: Colors.white,
            size: 45
          ),
        ],
      ),
    );
  }

  _buildCreditCardButton(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.black,
      onPressed: onPressed,
      child: const Row(
        children: [
          Icon(
            FontAwesomeIcons.solidCreditCard,
            color: Colors.white,
            size: 22
          ),
          Text('  Pagar', style: TextStyle(color: Colors.white, fontSize: 22)),
        ],
      ),
    );
  }
}
