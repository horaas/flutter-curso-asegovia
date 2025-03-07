import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

final colorsProvider = Provider((ref) => colorThemes);


final selectectdColorProvider = StateProvider((ref) => 0);