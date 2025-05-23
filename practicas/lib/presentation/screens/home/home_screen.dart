import 'package:flutter/material.dart';
import 'package:pelis_app/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';
import 'package:pelis_app/presentation/%20widget/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("title buttons"),
      ),
      body: _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItem.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItem[index];

        return _CustomListTile(menuItem: menuItem);
      }
      );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen()
        //   )
        // );

        // Navigator.of(context).pushNamed(menuItem.link);
        context.push(menuItem.link);
      },
      );
  }
}