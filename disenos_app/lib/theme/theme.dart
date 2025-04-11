import 'package:flutter/material.dart';

class ThemeChangerModel with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;

  ThemeChangerModel(int theme) {
    switch (theme) {
      case 1:
        _customTheme = false;
        _darkTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _customTheme = true;
        _darkTheme = false;
        break;
      default:
        _customTheme = false;
        _darkTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool darkTheme() => _darkTheme;
  bool customTheme() => _customTheme;
  ThemeData currentTheme() => _currentTheme;

  set setDarkTheme(bool enabled) {
    _customTheme = false;
    _darkTheme = enabled;
    if (enabled) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set setCustomTheme(bool enabled) {
    _darkTheme = false;
    _customTheme = enabled;

    if (enabled) {
      _currentTheme = ThemeData.dark().copyWith(
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xFF16202B),
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: const Color(0xFF48A0EB),
        ),
        textTheme: const TextTheme(
          labelMedium: TextStyle(color: Colors.red),
          labelSmall: TextStyle(color: Colors.red),
          labelLarge: TextStyle(color: Colors.red)

        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.red)
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
