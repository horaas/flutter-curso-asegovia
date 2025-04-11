import 'package:animate_do/animate_do.dart';
import 'package:disenos_app/models/layout_model.dart';
import 'package:disenos_app/presentation/slide_shows_screen.dart';
import 'package:disenos_app/routes/routes.dart';
import 'package:disenos_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreenTablet extends StatelessWidget {
  const HomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context).currentPage();

    return Scaffold(
      appBar: AppBar(title: const Text('data tablet')),
      body: Row(
        children: [
          const SizedBox(
            width: 300,
            height: double.infinity,
            child: _ListOptions(),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: Colors.grey,
          ),
          Expanded(child: layoutModel)
        ],
      ),
      drawer: const _DrawarIcon(),
    );
  }
}

class _ListOptions extends StatelessWidget {
  const _ListOptions();

  @override
  Widget build(BuildContext context) {
    
    final themeData = Provider.of<ThemeChangerModel>(context).currentTheme();

    return ListView.separated(
      itemCount: routes.length,
      separatorBuilder:
          (BuildContext context, int index) =>
              Divider(color: themeData.primaryColorLight),
      itemBuilder:
          (BuildContext context, int index) => ListTile(
            onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => routes[index].page,));
              final layoutModel = Provider.of<LayoutModel>(context, listen: false);
              layoutModel.setCurrentPage = routes[index].page;
            },
            leading: FaIcon(
              routes[index].icon,
              color: themeData.colorScheme.secondary,
            ),
            title: Text(routes[index].title),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: themeData.colorScheme.secondary,
            ),
          ),
    );
  }
}

class _DrawarIcon extends StatelessWidget {
  const _DrawarIcon({super.key});

  @override
  Widget build(BuildContext context) {

    final customThme = Provider.of<ThemeChangerModel>(context);
    final secondaryColor = customThme.currentTheme().colorScheme.secondary;
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 150,
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                child: const Text(
                  'AR',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              
            ),
          ),
          const Expanded(
            child: _ListOptions(),
          ),
          ListTile(
            onTap: () {},
            leading: customThme.darkTheme() ? FadeInLeft(
              animate: customThme.darkTheme(),
              child: FaIcon(
                FontAwesomeIcons.sun,
                color: secondaryColor,
              ),
            ) : FaIcon(
              FontAwesomeIcons.moon,
              color: secondaryColor,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              activeColor: secondaryColor,
              value: customThme.darkTheme(), onChanged: (value) => customThme.setDarkTheme = value,),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.fillDrip,
              color: secondaryColor,
            ),
            title: const Text('Theme'),
            trailing: Switch.adaptive(
              activeColor: secondaryColor,
              value: customThme.customTheme(), onChanged: (value) => customThme.setCustomTheme = value,),
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
