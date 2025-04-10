import 'package:disenos_app/widgets/pinterest/pinterest_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModelScreen(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [_PinterestGrid(), _PinterestMenuLcation()]),
          // PinterestMenuWidget()
          //  _PinterestGrid(),
        ),
      ),
    );
  }
}

class _PinterestMenuLcation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final showMenu = Provider.of<_MenuModelScreen>(context).showMenu;
    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Align(child: PinterestMenuWidget(show: showMenu,)),
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {

  const _PinterestGrid();

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final List items = List.generate(200, (i) => i);
  ScrollController scrollController = ScrollController();
  double previewScroll = 0;

@override
  void initState() {
    scrollController.addListener(() {
      if(scrollController.offset > previewScroll) {
        Provider.of<_MenuModelScreen>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_MenuModelScreen>(context, listen: false).showMenu = true;
      }
      previewScroll = scrollController.offset;
    },);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
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



class _MenuModelScreen with ChangeNotifier {
  bool _showMenu = true;


  bool get showMenu => _showMenu;
  set showMenu(bool show) {
    _showMenu = show;
    notifyListeners();
  }


}
