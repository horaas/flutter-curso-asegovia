import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottonAnimatedNotch extends ConsumerWidget {
  const CustomBottonAnimatedNotch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewActive = ref.read(ViewActiveProvider.notifier);

    NotchBottomBarController notchBottomBarController =
        NotchBottomBarController(index: viewActive.state);
    return AnimatedNotchBottomBar(
      notchBottomBarController: notchBottomBarController,
      bottomBarItems: [
        const BottomBarItem(
          inActiveItem: Center(child: Icon(Icons.home_outlined, color: Colors.blueGrey)),
          activeItem: Icon(Icons.home_filled, color: Colors.white ),
          itemLabel: 'Categoria',
        ),
        const BottomBarItem(
          inActiveItem: Icon(Icons.label_outline, color: Colors.blueGrey),
          activeItem: Icon(Icons.label, color: Colors.white ),
          itemLabel: 'Nuevas',
        ),
        const BottomBarItem(
          inActiveItem: Icon(Icons.favorite_border, color: Colors.blueGrey),
          activeItem: Icon(Icons.favorite, color: Colors.white , ),
          itemLabel: 'Favoritos',
        ),
        
      ],
      onTap: (value) {
        viewActive.update((state) => value);
      },
      
      kIconSize: 24,
      kBottomRadius: 20,
      // showLabel: false,
      // color: Colors.red,
      textOverflow: TextOverflow.visible,
      notchColor: Colors.yellow,
      itemLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      maxLine: 1,
      elevation: 1,
    );
  }
}
