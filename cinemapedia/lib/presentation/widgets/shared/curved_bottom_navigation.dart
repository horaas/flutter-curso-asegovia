import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurvedBottomNavigation extends ConsumerWidget {
  const CurvedBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewActive = ref.read(ViewActiveProvider.notifier);

    return CurvedNavigationBar(
      onTap: (value) {
        viewActive.update((state) => value);
      },
      index: viewActive.state,

      items: [
        CurvedNavigationBarItem(
          child: Icon(Icons.home_outlined),
          label: 'Categoria',
        ),
        CurvedNavigationBarItem(
          child: Icon(Icons.label_outline),
          label: 'Categoria',
        ),
        CurvedNavigationBarItem(
          child: Icon(Icons.favorite_border),
          label: 'Favoritos',
        ),
      ],
      color: Colors.grey.shade200,
      backgroundColor: Colors.white,
    );
  }
}
