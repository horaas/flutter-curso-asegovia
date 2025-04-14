import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    GoRoute(
      path: '/permissions',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: const PermissionsScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curveAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );
              return SlideTransition(
                position: Tween(
                  begin: Offset(-0.5, 1.0),
                  end: Offset.zero,
                ).animate(curveAnimation),
                child: child,
              );
            },
          ),
    ),
    GoRoute(
      path: '/giroscopio',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const GiroscpopeScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curveAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(curveAnimation),
                child: child,
              );
            },
          ),
    ),
    GoRoute(
      path: '/acelerometer',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const AcelerometerScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curveAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );

              return RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(curveAnimation)
              ,child: child,);
              
            },
          ),
    ),
    GoRoute(
      path: '/magnometer',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const MagnometerScreen(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              final curveAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );

              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(curveAnimation)
              ,child: child,);
              
            },
          ),
    ),
    // GoRoute(
    //   path: '/giroscopio',
    //   builder: (context, state) => const GiroscpopeScreen(),
    // ),
    // GoRoute(
    //   path: '/acelerometer',
    //   builder: (context, state) => const AcelerometerScreen(),
    // ),
    // GoRoute(
    //   path: '/magnometer',
    //   builder: (context, state) => const MagnometerScreen(),
    // ),
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
