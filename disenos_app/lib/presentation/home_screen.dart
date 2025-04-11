import 'package:disenos_app/routes/routes.dart';
import 'package:disenos_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('data')),
      body: const _ListOptions(),
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
               Navigator.push(context, MaterialPageRoute(builder: (context) => routes[index].page,));
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
            leading: FaIcon(
              FontAwesomeIcons.moon,
              // FontAwesomeIcons.sun,
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
