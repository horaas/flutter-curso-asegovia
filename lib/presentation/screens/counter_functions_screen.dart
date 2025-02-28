import 'package:flutter/material.dart';

class CounterFunctionsScreens extends StatefulWidget {
  const CounterFunctionsScreens({
    super.key,
  });

  @override
  State<CounterFunctionsScreens> createState() =>
      _CounterFunctionsScreensState();
}

class _CounterFunctionsScreensState extends State<CounterFunctionsScreens> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text("counter Screen"),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$clickCounter",
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              "Click${clickCounter == 1 ? '' : 's'}",
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {
                if (clickCounter == 0) return;
                clickCounter--;
              });
            },
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
