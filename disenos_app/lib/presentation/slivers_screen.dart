import 'package:flutter/material.dart';

class SliversScreen extends StatelessWidget {
  const SliversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      // _TitleHeader(),
       _TaskListView(),
    );
  }
}

class _TitleHeader extends StatelessWidget {
  const _TitleHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Text(
            'New',
            style: TextStyle(color: Colors.black, fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 15,
              child: Container(
                width: 120,
                height: 7,
                color: Colors.redAccent.withValues(alpha: 0.4),
              ),
            ),
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TaskListView extends StatelessWidget {
  const _TaskListView();

  @override
  Widget build(BuildContext context) {
    final items = [
      const _TaskItem('Orange', Color(0xffF08F66)),
      const _TaskItem('Family', Color(0xffF2A38A)),
      const _TaskItem('Subscriptions', Color(0xffF7CDD5)),
      const _TaskItem('Books', Color(0xffFCEBAF)),
      const _TaskItem('Orange', Color(0xffF08F66)),
      const _TaskItem('Family', Color(0xffF2A38A)),
      const _TaskItem('Subscriptions', Color(0xffF7CDD5)),
      const _TaskItem('Books', Color(0xffFCEBAF)),
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _TaskItem extends StatelessWidget {
  final String title;
  final Color color;
  const _TaskItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 130,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}
