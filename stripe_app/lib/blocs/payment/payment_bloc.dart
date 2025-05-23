import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/models/credit_card_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<OnSelectedCard>((event, emit) {
      emit(
        state.copyWith(cardActive: true, card: event.card, isManualProcess: false)
      );
    });
    on<OnRemoveSelectedCard>((event, emit) {
      emit(
        state.copyWith(cardActive: false, isManualProcess: false)
      );
    });
    on<OnIsManualSelectedCard>((event, emit) {
      emit(
        state.copyWith(isManualProcess: true)
      );
    });

  }
}
