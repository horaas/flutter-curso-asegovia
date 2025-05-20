import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:stripe_app/config/config.dart';
import 'package:stripe_app/models/models.dart';

//TODO esto se deberia de cargar mediante un stado para poder manejar de alguna base de datos 

final BillingDetails defaultDataBillDetails = const BillingDetails(
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

class StripeService {
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  final Dio _dioStripe = Dio(
    BaseOptions(
      baseUrl: Environment.paymnetApiUrl,
      queryParameters: {},
      headers: {'Authorization': 'Bearer ${Environment.secretKey}'},
    ),
  );

  void init() {
    Stripe.publishableKey = Environment.apiKey;
    Stripe.urlScheme = 'test';
    Stripe.merchantIdentifier = 'test';
  }

  Future<StripeCustomResponse> paymentWithcardSelect({
    required String amount,
    required String currency,
    required CreditCardModel card,
  }) async {
    try {
      final monthYear = card.expiracyDate.split('/');
      // Create updateDataCard
      await Stripe.instance.dangerouslyUpdateCardDetails(CardDetails(
        number: card.cardNumber,
        cvc: card.cvv,
        expirationMonth: int.parse(monthYear.first),
        expirationYear: int.parse(monthYear.last),
      ));

      final paymentParamas = PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
          billingDetails: defaultDataBillDetails
        )
      );

      return await _handlePaymentProcess(amount: amount, currency: currency, paymentMethodParams: paymentParamas);
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: 'error');
    }
  }

  Future<StripeCustomResponse> paymentWithNewcard({
    required String amount,
    required String currency,
  }) async {
    try {
       
      // this process is data from user required
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
      final paymentParamas = PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
          billingDetails: billingDetails
        )
      );

      return await _handlePaymentProcess(amount: amount, currency: currency, paymentMethodParams: paymentParamas);

    } catch (e) {
      return StripeCustomResponse(ok: false, msg: 'error');
    }
  }

  Future<StripeCustomResponse> paymentWithApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {
    try {
      final googlePaySupported = await Stripe.instance
        .isPlatformPaySupported(googlePay: const IsGooglePaySupportedParams());


      if (!googlePaySupported) {
      return StripeCustomResponse(ok: false, msg: 'google play not soprted');
      }
      final paymentIntet = await _createPaymentInten(
        amount: amount,
        currency: currency,
      );
      await Stripe.instance.confirmPlatformPayPaymentIntent(
        clientSecret: paymentIntet.clientSecret,
        confirmParams: PlatformPayConfirmParams.googlePay(
          googlePay: GooglePayParams(
            testEnv: Environment.isDev,
            merchantName: 'Example for payment',
            merchantCountryCode: 'US',
            currencyCode: currency,
          ),
        ),
      );
      // final paymentMethod = await Stripe.instance
      //     .createPlatformPayPaymentMethod(
      //       params: PlatformPayPaymentMethodParams.applePay(
      //         applePayParams: ApplePayParams(
      //           cartItems: [
      //             ApplePayCartSummaryItem.immediate(
      //               label: 'Product Test',
      //               amount: amount,
      //             ),
      //           ],
      //           merchantCountryCode: 'Es',
      //           currencyCode: currency,
      //         ),
      //       ),
      //     );
      // final paymentParamas = PaymentMethodParams.card(
      //     paymentMethodData: PaymentMethodData(
      //     billingDetails: defaultDataBillDetails
      //   )
      // );

      // return await _handlePaymentProcess(amount: amount, currency: currency, paymentMethodParams: paymentParamas);
      return StripeCustomResponse(ok: false, msg: 'error');
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: 'error');
    }
  }

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
    required PaymentMethodParams paymentMethodParams,
  }) async {
    try {
     final paymentIntet = await _createPaymentInten(
        amount: amount,
        currency: currency,
      );
      final paymentProcess = await Stripe.instance.confirmPayment(paymentIntentClientSecret: paymentIntet.clientSecret, data: paymentMethodParams);

      if (paymentProcess.status == PaymentIntentsStatus.Succeeded) {
        return StripeCustomResponse(ok: true);
      }
      return StripeCustomResponse(ok: false, msg: 'error de pago');
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: 'error exception');
    }
  }
}


