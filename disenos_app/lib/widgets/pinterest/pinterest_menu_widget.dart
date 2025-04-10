import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final Function onPresed;

  PinterestButton({required this.icon, required this.onPresed});
}

class PinterestMenuWidget extends StatelessWidget {
  final List<PinterestButton> optionsButtons = [
    PinterestButton(icon: Icons.pie_chart, onPresed: () => print('pie_chart')),
    PinterestButton(icon: Icons.search, onPresed: () => print('search')),
    PinterestButton(
      icon: Icons.notifications,
      onPresed: () => print('notifications'),
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      onPresed: () => print('supervised_user_circle'),
    ),
  ];
  PinterestMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: _PinterestMenuBackground(child: _MenuItems(optionsButtons),)),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index]),),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<_MenuModel>(context).currentItemSelected;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).currentItemSelected = index;
        item.onPresed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(item.icon, 
      size: itemSelected == index ? 35 : 25,
      color: itemSelected == index ? Colors.redAccent : Colors.blueGrey,),
    );
  }
}


class _MenuModel with ChangeNotifier {
  int _currentItemSelected = 0;


  int get currentItemSelected => _currentItemSelected;
  set currentItemSelected(int currentItemSelected) {
    _currentItemSelected = currentItemSelected;
    notifyListeners();
  }


}
