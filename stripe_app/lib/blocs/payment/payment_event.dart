part of 'payment_bloc.dart';


abstract class PaymentEvent  extends Equatable {

  @override
  List<Object> get props => [];
}

class OnSelectedCard extends PaymentEvent {
  final CreditCardModel card;

  OnSelectedCard(this.card);
}
class OnRemoveSelectedCard extends PaymentEvent {
  
}
