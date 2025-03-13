import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const name = 'home-screen';
  final int pageIdex;
  
  const HomeScreen({super.key, required this.pageIdex});

  final viewRoutes = const <Widget>[
    HomeView(),
    Placeholder(),
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewActive = ref.watch(ViewActiveProvider);
    return Scaffold(
      body: IndexedStack(
        index: viewActive,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottonNavigationbar(),
    );
  }
}
