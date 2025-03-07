import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_app/presentation/providers/light_mode_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(''), actions: [
        IconButton(
          icon: Icon(isDarkMode
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined),
          onPressed: () {
            ref.read(isDarkModeProvider.notifier).update((state) => !state);
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

    final int colorSelected = ref.watch(selectectdColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color ', style: TextStyle(color: color),),
          subtitle: Text('${color.r}'),
          activeColor: color,
          value: index,
          groupValue: colorSelected,
          onChanged: 
          (value) {
            ref.read(selectectdColorProvider.notifier).state = index;
          },);
      },
    );
  }
}
