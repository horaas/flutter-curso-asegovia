import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_app/models/credit_card_model.dart';

class StripeService {
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  final String _paymnetApiUrl = 'https://api.stripe.com/v1/payment_intents';
  final String _secretKey =
      'sk_test_51RP4f1RuQvIbUXD4jPRHsqw4BOoEoyyf5JKp3jFNapH1UxGkIuz0JdHPwM4ZXSPMtEl9idIGYgrW1QvZZLkvN50i00X03KAd3s';

  void init() {}

  Future<void> paymentWithcardSelect({
    required String amount,
    required String currency,
    required CreditCardModel card,
  }) async {}

  Future<void> paymentWithNewcard({
    required String amount,
    required String currency,
  }) async {}

  Future<void> paymentWithApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {}

  Future<void> _createPaymentInten({
    required String amount,
    required String currency,
  }) async {}

  Future<void> _handlePaymentProces({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {}
}
