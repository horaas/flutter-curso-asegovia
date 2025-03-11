import 'package:flutter/material.dart';

class CustomBottonNavigationbar extends StatelessWidget {
  const CustomBottonNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Categoria',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
