import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'button_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("buttons"),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elvated")),
            const ElevatedButton(onPressed: null, child: Text("Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text("ElevatedButton icon")
            ),
            FilledButton(onPressed: () {}, child: const Text("FilledButton")),
            FilledButton.icon(onPressed: () {},
              icon: const Icon(Icons.access_time_filled_sharp),
              label: const Text("FilledButton icon"),

            ),
            OutlinedButton(onPressed: () {}, child: const Text("OutlinedButton")),
            OutlinedButton.icon(onPressed: () {},
              icon: const Icon(Icons.access_time_filled_sharp),
              label: const Text("OutlinedButton icon"),

            ),
            TextButton(onPressed: () {}, child: const Text("TextButton")),
            TextButton.icon(onPressed: () {},
              icon: const Icon(Icons.accessibility_sharp),
              label: const Text("TextButton icon"),

            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded)
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(colors.inversePrimary)
              ),
            ),
          ],
        ),
      ),
    );
  }
}