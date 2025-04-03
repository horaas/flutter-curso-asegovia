import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);
const List<Color> colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Color(0xFF2852F5)
];



class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 7}):
  assert(selectedColor >= 0 && selectedColor < colorThemes.length, 'colors must betwen 0 and ${colorThemes.length}');



  ThemeData getTheme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed:  colorThemes[selectedColor], appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
    brightness: isDarkMode ? Brightness.dark : Brightness.light);
  }

  copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(selectedColor: selectedColor ?? this.selectedColor, isDarkMode: isDarkMode ?? this.isDarkMode);
}