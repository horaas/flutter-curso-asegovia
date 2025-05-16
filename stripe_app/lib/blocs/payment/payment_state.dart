part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final double amountPayment;
  final String currency;
  final bool cardActive;
  final bool isManualProcess;
  final CreditCardModel? card;

  const PaymentState({
    this.amountPayment = 375,
    this.currency = 'USD',
    this.cardActive = false,
    this.card,
    this.isManualProcess = false,
  });
  PaymentState copyWith({
    double? amountPayment,
    String? currency,
    bool? cardActive,
    CreditCardModel? card,
    bool? isManualProcess,
  }) => PaymentState(
    amountPayment: amountPayment ?? this.amountPayment,
    currency: currency ?? this.currency,
    cardActive: cardActive ?? this.cardActive,
    card: card ?? this.card,
    isManualProcess: isManualProcess ?? this.isManualProcess
  );


  String get paymentAmountString => '${(amountPayment*100).floor()}';

  @override
  List<Object?> get props => [amountPayment, currency, cardActive, card, isManualProcess];
}
