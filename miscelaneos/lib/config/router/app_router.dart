import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionsScreen(),
    ),
    GoRoute(
      path: '/giroscopio',
      builder: (context, state) => const GiroscpopeScreen(),
    ),
    GoRoute(
      path: '/acelerometer',
      builder: (context, state) => const AcelerometerScreen(),
    ),
    GoRoute(
      path: '/magnometer',
      builder: (context, state) => const MagnometerScreen(),
    ),
    GoRoute(
      path: '/giroscope-ball',
      builder: (context, state) => const GiroscopeBallScreen(),
    ),
    GoRoute(
      path: '/compass',
      builder: (context, state) => const CompassScreen(),
    ),
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final pokemonId = state.pathParameters['id'];
            return PokemonScreen(pokemonId: pokemonId ?? '1',);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/biometric',
      builder: (context, state) => const BiometricScreen(),
    ),
    GoRoute(
      path: '/location',
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: '/maps',
      builder: (context, state) => const MapsScreen(),
    ),
    GoRoute(
      path: '/controll-map',
      builder: (context, state) => const ControlledMapScreen(),
    ),
    
    GoRoute(
      path: '/badge',
      builder: (context, state) => const BadgeScreen(),
    ),
  ],
);
