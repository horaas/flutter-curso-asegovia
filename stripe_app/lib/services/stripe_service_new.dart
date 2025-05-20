import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_app/models/credit_card_model.dart';
import 'package:stripe_app/models/models.dart';

class StripeService {
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  final String _paymnetApiUrl = 'https://api.stripe.com/v1';
  static final String _secretKey =
      'sk_test_51RP4f1RuQvIbUXD4jPRHsqw4BOoEoyyf5JKp3jFNapH1UxGkIuz0JdHPwM4ZXSPMtEl9idIGYgrW1QvZZLkvN50i00X03KAd3s';
  final String _apiKey =
      'pk_test_51RP4f1RuQvIbUXD4KsaKFMUXFCnPYUabI8AkXd4xdETXQuLKK4b0kxxYpUC72N3cly6JNTC0i6zjE44yrUBC1Vgg00yMBHIrZG';

  final Dio _dioStripe = Dio(
    BaseOptions(
      baseUrl: 'https://api.stripe.com/v1',
      queryParameters: {},
      headers: {'Authorization': 'Bearer $_secretKey'},
    ),
  );

  void init() {
    Stripe.publishableKey = _apiKey;
    Stripe.urlScheme = 'test';
    Stripe.merchantIdentifier = 'test';
  }

  Future<void> paymentWithcardSelect({
    required String amount,
    required String currency,
    required CreditCardModel card,
  }) async {}

  Future<void> paymentWithNewcard({
    required String amount,
    required String currency,
  }) async {
    try {
      final response = await _createPaymentInten(
        amount: amount,
        currency: currency,
      );
      final billingDetails = const BillingDetails(
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      ); 
       await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          billingDetails: billingDetails,
          paymentIntentClientSecret: response.clientSecret,
          merchantDisplayName: 'Ikay'
        )
       );
       await Stripe.instance.presentPaymentSheet();
      // return StripeCustomResponse(ok: true);
    } catch (e) {
      print('hola');
      print(e.toString());
      // return StripeCustomResponse(ok: false, msg: 'error');
    }
  }

  Future<void> paymentWithApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {}

  Future<PaymentIntentResponse> _createPaymentInten({
    required String amount,
    required String currency,
  }) async {
    try {
      final data = {'amount': amount, 'currency': currency};

      final response = await _dioStripe.post(
        '/payment_intents',
        queryParameters: data,
      );
         
      return PaymentIntentResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('error ${e.toString()}');
      if (e.response?.statusCode == 401) throw Exception();

      throw Exception();
    } catch (e) {
      print('error ${e.toString()}');
      throw Exception();
    }
  }

  Future<StripeCustomResponse> _handlePaymentProcess({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {
    try {
      final response = await _createPaymentInten(
        amount: amount,
        currency: currency,
      );
      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: 'error');
    }
  }
}


