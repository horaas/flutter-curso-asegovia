import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottonNavigationbar extends ConsumerWidget {

  const CustomBottonNavigationbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewActive = ref.read(ViewActiveProvider.notifier);

    return BottomNavigationBar(
      onTap: (value) {
        viewActive.update((state) => value);
      },
        elevation: 0,
        currentIndex: viewActive.state,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Categoria',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
