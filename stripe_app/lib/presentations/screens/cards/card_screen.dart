import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/presentations/widgets/total_pay_button.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Pago'), leading: IconButton(onPressed: () {
        paymentBloc.add(OnRemoveSelectedCard());
        Navigator.pop(context);
      }, icon: const Icon(FontAwesomeIcons.chevronLeft)),),
      body: Stack(
        children: [
          Container(),
          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return Hero(
                tag: state.card!.cardNumber,
                child: CreditCardWidget(
                  cardNumber: state.card!.cardNumber,
                  expiryDate: state.card!.expiracyDate,
                  cardHolderName: state.card!.cardHolderName,
                  cvvCode: state.card!.cvv,
                  showBackView: false,
                  onCreditCardWidgetChange: (p0) {},
                  isSwipeGestureEnabled: false,
                ),
              );
            },
          ),
          const Positioned(bottom: 0, child: TotalPayButton()),
        ],
      ),
    );
  }
}
