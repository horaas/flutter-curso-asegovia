import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

final colorsProvider = Provider((ref) => colorThemes);


final selectectdColorProvider = StateProvider((ref) => 0);

//objeto del tip APPTHEME(custom)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
  );

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(): super(AppTheme());

  void toggleChangeDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  changeColor(int color) {
    state = state.copyWith(selectedColor: color);
  }

}