import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigationbar extends StatelessWidget {
  const CustomBottonNavigationbar({super.key});

  int curentIndex(BuildContext context) {
    final routeActive = GoRouterState.of(context).fullPath;
    print(routeActive);
    switch (routeActive) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }

  onTapItems(BuildContext context, int tapItem) {
    switch (tapItem) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/categories');
        break;
      case 2:
        context.go('/favorites');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      onTap: (value) => onTapItems(context, value),
      currentIndex: curentIndex(context),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Categoria',
          activeIcon: Icon(Icons.home)
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favoritos',
          activeIcon: Icon(Icons.favorite),
        ),
      ],
    );
  }
}
