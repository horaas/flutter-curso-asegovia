import 'package:disenos_app/widgets/pinterest/pinterest_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [_PinterestGrid(), _PinterestMenuLcation()]),
        // PinterestMenuWidget()
        //  _PinterestGrid(),
      ),
    );
  }
}

class _PinterestMenuLcation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Align(child: PinterestMenuWidget()),
      ),
    );
  }
}

class _PinterestGrid extends StatelessWidget {
  final List items = List.generate(200, (i) => i);

  _PinterestGrid();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 6,
        children: [...items.map((index) => _PinterstItem(index))],
      ),
    );
  }
}

class _PinterstItem extends StatelessWidget {
  final int index;
  const _PinterstItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: index.isEven ? 300 : 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}
