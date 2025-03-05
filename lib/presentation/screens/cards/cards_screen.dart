import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 2.0, 'label': 'Elevation 1'},
  {'elevation': 3.0, 'label': 'Elevation 2'},
  {'elevation': 4.0, 'label': 'Elevation 3'},
  {'elevation': 2.0, 'label': 'Elevation 4'},
];
class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("cards"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map((map) => _CardType1(elevation: map['elevation'],label: map['label'],)),

            ...cards.map((map) => _CardType2(elevation: map['elevation'],label: map['label'],)),

            ...cards.map((map) => _CardType3(elevation: map['elevation'],label: map['label'],)),

            ...cards.map((map) => _CardType4(elevation: map['elevation'],label: map['label'],)),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: const Icon(Icons.more_vert_outlined), onPressed: () {}),
          ),
          Align(alignment: Alignment.bottomLeft, child: Text(label)),
        ]),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {


    final colors = Theme.of(context).colorScheme;


    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: const Icon(Icons.more_vert_outlined), onPressed: () {}),
          ),
          Align(alignment: Alignment.bottomLeft, child: Text('$label - outline')),
        ]),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.onSurfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: const Icon(Icons.more_vert_outlined), onPressed: () {}),
          ),
          Align(alignment: Alignment.bottomLeft, child: Text('$label - filed')),
        ]),
      ),
    );
  }
}


class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.onSurfaceVariant,
      elevation: elevation,
      clipBehavior: Clip.hardEdge,
      child: Stack(children: [
        Image.network(
          'https://picsum.photos/id/${elevation.toInt()}/600/350',
          height: 350,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
            ),
            child: IconButton(
                icon: const Icon(Icons.more_vert_outlined), onPressed: () {}),
          ),
        ),
      ]),
    );
  }
}
