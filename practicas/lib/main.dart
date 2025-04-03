import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_app/config/routes/app-router.dart';
import 'package:pelis_app/config/theme/app_theme.dart';
import 'package:pelis_app/presentation/providers/light_mode_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    // final int selectedColor = ref.watch(selectectdColorProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(isDarkMode: isDarkMode, selectedColor: selectedColor).getTheme(),
      theme: appTheme.getTheme(),
    );
  }
}
