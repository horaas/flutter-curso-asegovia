import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData iocn;
  final String reoute;

  MenuItem(this.title, this.iocn, this.reoute);
}

final menuItems = <MenuItem>[
  MenuItem("Giroscopo", Icons.access_alarm, '/giroscopio'),
  MenuItem("Acelerometro", Icons.access_alarm, '/acelerometer'),
  MenuItem("Magnometros", Icons.access_alarm, '/magnometer'),
  MenuItem("Giroscopio ball", Icons.access_alarm, '/giroscope-ball'),
  MenuItem("Brujula", Icons.access_alarm, '/compass'),
  MenuItem("Pkemons", Icons.catching_pokemon, '/pokemons'),
  MenuItem("Biometria", Icons.fingerprint, '/biometric'),
  MenuItem("Localización", Icons.location_on, '/location'),
  MenuItem("Mapa", Icons.map, '/maps'),
  MenuItem("controlado", Icons.gamepad_outlined, '/controll-map'),
];

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children:
          menuItems
              .map(
                (item) => MainMenuItem(
                  title: item.title,
                  route: item.reoute,
                  icon: item.iocn,
                ),
              )
              .toList(),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> colors;
  const MainMenuItem({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
    this.colors = const [Colors.lightBlue, Colors.blue],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(icon, color: Colors.white,),
          const SizedBox(height: 10,),
          Text(title, textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)
        ],),
      ),
    );
  }
}
