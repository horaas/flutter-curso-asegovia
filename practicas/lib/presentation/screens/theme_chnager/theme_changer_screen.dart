import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_app/config/theme/app_theme.dart';
import 'package:pelis_app/presentation/providers/light_mode_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme isDarkMode = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(''), actions: [
        IconButton(
          icon: Icon(isDarkMode.isDarkMode
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined),
          onPressed: () {
            // ref.read(isDarkModeProvider.notifier).update((state) => !state);
            ref.read(themeNotifierProvider.notifier).toggleChangeDarkMode();
          },
        )
      ]),
      body: const _ThemChangeView(),
    );
  }
}

class _ThemChangeView extends ConsumerWidget {
  const _ThemChangeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorsProvider);

    final AppTheme appThemProvider = ref.watch(themeNotifierProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color ', style: TextStyle(color: color),),
          subtitle: Text('${color.r}'),
          activeColor: color,
          value: index,
          groupValue: appThemProvider.selectedColor,
          onChanged: 
          (value) {
            ref.read(themeNotifierProvider.notifier).changeColor(index);
          },);
      },
    );
  }
}
