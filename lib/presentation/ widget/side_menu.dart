import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pelis_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrayIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNoctch = MediaQuery.of(context).padding.top > 35;
    return NavigationDrawer(
        selectedIndex: navDrayIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrayIndex = value;
          });
          final menuItem = appMenuItem[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNoctch ? 0 : 20, 16, 10),
            child: const Text("Main"),
          ),
          ...appMenuItem
          .sublist(0,3)
          .map((menu) => NavigationDrawerDestination(
            icon: Icon(menu.icon),
            label: Text(menu.title)
          )),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNoctch ? 0 : 20, 16, 10),
            child: const Text("More option"),
          ),
          ...appMenuItem
          .sublist(3)
          .map((menu) => NavigationDrawerDestination(
            icon: Icon(menu.icon),
            label: Text(menu.title)
          )),
        ]);
  }
}
