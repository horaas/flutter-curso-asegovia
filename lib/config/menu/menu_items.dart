import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({required this.title, required this.subTitle, required this.link, required this.icon});


}

const appMenuItem = <MenuItems> [
  MenuItems(title: 'ChnageTheme', subTitle: 'cambiador de tema', link: '/theme-change', icon: Icons.color_lens),
  MenuItems(title: 'Counter', subTitle: 'Contador', link: '/counter', icon: Icons.plus_one_outlined),
  MenuItems(title: 'Botones', subTitle: 'varios botones', link: '/buttons', icon: Icons.smart_button_outlined),
  MenuItems(title: 'Tarjetas', subTitle: 'vontenedor estelizado', link: '/cards', icon: Icons.credit_card),
  MenuItems(title: 'Progress', subTitle: 'Progress page', link: '/progress', icon: Icons.refresh),
  MenuItems(title: 'Animated', subTitle: 'animated page', link: '/animated', icon: Icons.animation),
  MenuItems(title: 'App Tutorial', subTitle: 'app estelizado', link: '/app_tutorial', icon: Icons.book),
  MenuItems(title: 'Infinite Scroll', subTitle: 'infinitScroll estelizado', link: '/scroll', icon: Icons.arrow_downward_outlined),
  MenuItems(title: 'SnackBar', subTitle: 'SnackBar estelizado', link: '/snackbar', icon: Icons.bar_chart),
  MenuItems(title: 'Ui Controls', subTitle: 'UiControls estelizado', link: '/uiscontrols', icon: Icons.control_point),
];