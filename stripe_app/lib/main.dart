import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/config/environment.dart';
import 'package:stripe_app/presentations/screens/screens.dart';
import 'package:stripe_app/services/stripe_service.dart';

void main() async {
  await Environment.initEnviroments();
  WidgetsFlutterBinding.ensureInitialized();
  StripeService().init();
  await Stripe.instance.applySettings();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PaymentBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: const Color(0xff21232A),
          primaryColor: const Color(0xff284879),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            titleTextStyle: const TextStyle().copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
            iconTheme: const IconThemeData().copyWith(color: Colors.white),
          ),
        ),
        routes: {
          'home': (_) => const HomeScreen(),
          'payment': (_) => const PaymentSuccesfull(),
        },
      ),
    );
  }
}
