import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/blocs/blocs.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('255.55 Usd', style: TextStyle(fontSize: 20)),
            ],
          ),
          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return _BtnPay(state);
            }),
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  final PaymentState state;

  const _BtnPay(this.state);

  @override
  Widget build(BuildContext context) {
    return state.cardActive ? _buildCreditCardButton(context) : _buildPayButton(context);
  }
  
  _buildPayButton(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.black,
      child: Row(
        children: [
          Icon(
            Platform.isAndroid ? FontAwesomeIcons.googlePay : FontAwesomeIcons.applePay,
            color: Colors.white,
            size: 45
          ),
        ],
      ),
      onPressed: () {},
    );
  }

  _buildCreditCardButton(BuildContext context) {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.black,
      child: const Row(
        children: [
          Icon(
            FontAwesomeIcons.solidCreditCard,
            color: Colors.white,
            size: 22
          ),
          Text(' Pay', style: TextStyle(color: Colors.white, fontSize: 22)),
        ],
      ),
      onPressed: () {},
    );
  }
}
