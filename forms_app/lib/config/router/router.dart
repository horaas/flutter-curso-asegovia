import 'package:forms_app/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen(),),
    GoRoute(path: '/cubit', builder: (context, state) => CubitCounterScreen(),),
    GoRoute(path: '/bloc', builder: (context, state) => BlocCounterScreen(),),
    GoRoute(path: '/user', builder: (context, state) => CreateNewUserScreen(),)
  ],
);
