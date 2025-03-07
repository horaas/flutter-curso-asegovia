import 'package:go_router/go_router.dart';
import 'package:pelis_app/presentation/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/theme-change',
      builder: (context, state) => const ThemeChangerScreen(),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/app_tutorial',
      builder: (context, state) => const AppTutorialScreen(),
    ),
    GoRoute(
      path: '/scroll',
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: '/snackbar',
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/uiscontrols',
      builder: (context, state) => const UiControlsScreen(),
    ),
  ],
);