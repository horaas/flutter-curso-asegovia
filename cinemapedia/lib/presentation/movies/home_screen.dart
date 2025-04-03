import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_botton_animated_notch.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';
  
  HomeScreen({super.key});

  final viewRoutes = const <Widget>[
    HomeView(),
    Placeholder(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewActive = ref.watch(ViewActiveProvider);
    return Scaffold(
      body: 
       IndexedStack(
        index: viewActive,
        children: viewRoutes,
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottonAnimatedNotch(),
    );
  }
}
