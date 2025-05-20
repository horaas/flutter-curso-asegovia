import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/data/credist_cards_data.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/presentations/screens/screens.dart';
import 'package:stripe_app/presentations/widgets/total_pay_button.dart';
import 'package:stripe_app/services/stripe_service.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stripeServices = StripeService();
    final size = MediaQuery.of(context).size;
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Pago'), actions: [
        IconButton(
            onPressed: () async {
              paymentBloc.add(OnIsManualSelectedCard());
              Navigator.push(context, navigateFadein(context, const AddCardPay())); 
            },
            icon: const Icon(FontAwesomeIcons.plus))
      ],),
      body: Stack(
        children: [
          Positioned(
            height: size.height,
            width: size.width,
            top: size.height * 0.25,
            child: PageView.builder(
              itemCount: creditCardsData.length,
              scrollDirection: Axis.horizontal,
              controller: PageController(viewportFraction: 0.88),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final card = creditCardsData[index];
                return GestureDetector(
                  onTap: () {
                    paymentBloc.add(OnSelectedCard(card));
                    Navigator.push(context, navigateFadein(context, const CardScreen())); 
                  },
                  child: Hero(
                    tag: card.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: card.cardNumber,
                      expiryDate: card.expiracyDate,
                      cardHolderName: card.cardHolderName,
                      cvvCode: card.cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (p0) {},
                      isSwipeGestureEnabled: false,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton(onPressed: () async {

              showLoading(context);
              final paymentBlocState = paymentBloc.state;
              final responseProcessPayment = await StripeService()
                    .paymentWithApplePayGooglePay(
                      amount: paymentBlocState.paymentAmountString,
                      currency: paymentBlocState.currency
                    );
                if (context.mounted) {
                  Navigator.of(context).pop();
                  if (responseProcessPayment.ok) {
                    Navigator.push(
                      context,
                      navigateFadein(context, const PaymentSuccesfull()),
                    );
                  } else {
                    showAlert(context, 'Error', responseProcessPayment.msg);
                  }
                }
            },) 
          )
        ],
      ),
    );
  }
}
