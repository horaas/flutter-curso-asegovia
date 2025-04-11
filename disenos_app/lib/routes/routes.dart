import 'package:disenos_app/presentation/animations_screen.dart';
import 'package:disenos_app/presentation/emergency_screen.dart';
import 'package:disenos_app/presentation/graficars_circulares_screen.dart';
import 'package:disenos_app/presentation/pinterest_screen.dart';
import 'package:disenos_app/presentation/slide_shows_screen.dart';
import 'package:disenos_app/presentation/slivers_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}

final routes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Sliders', const SlideShowsScreen()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyScreen()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro animado', const AnimationsScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra de progreso', const GraficarsCircularesScreen()),
  _Route(FontAwesomeIcons.pinterest, 'Pinteres', const PinterestScreen()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliversScreen()),
];