import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/data/credist_cards_data.dart';
import 'package:stripe_app/presentations/widgets/total_pay_button.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pago')),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: creditCardsData[0].cardNumber,
            child: CreditCardWidget(
              cardNumber: creditCardsData[0].cardNumber,
              expiryDate: creditCardsData[0].expiracyDate,
              cardHolderName: creditCardsData[0].cardHolderName,
              cvvCode: creditCardsData[0].cvv,
              showBackView: false,
              onCreditCardWidgetChange: (p0) {},
              isSwipeGestureEnabled: false,
            ),
          ),
          const Positioned(bottom: 0, child: TotalPayButton()),
        ],
      ),
    );
  }
}
