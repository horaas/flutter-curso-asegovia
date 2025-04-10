import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final Function onPresed;

  PinterestButton({required this.icon, required this.onPresed});
}

class PinterestMenuWidget extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> optionsButtons;

  PinterestMenuWidget({super.key, this.show = true, this.backgroundColor = Colors.white, this.activeColor = Colors.redAccent, this.inactiveColor = Colors.blueGrey, required this.optionsButtons});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      builder: (context, child) {
        Provider.of<_MenuModel>(context, listen: false).backgroundColor = backgroundColor;
        Provider.of<_MenuModel>(context, listen: false).inactiveColor = inactiveColor;
        Provider.of<_MenuModel>(context, listen: false).activeColor = activeColor;
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: show ? 1 : 0,
          child: _PinterestMenuBackground(child: _MenuItems(optionsButtons)),
        );
      },
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context, listen: false).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          const BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
        ],
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
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuButton(index, menuItems[index]),
      ),
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
    final activeColor = Provider.of<_MenuModel>(context, listen: false).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context, listen: false).inactiveColor;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).currentItemSelected =
            index;
        item.onPresed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: itemSelected == index ? 35 : 25,
        color: itemSelected == index ? activeColor : inactiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _currentItemSelected = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.redAccent;
  Color _inactiveColor = Colors.blueGrey;

  int get currentItemSelected => _currentItemSelected;
  set currentItemSelected(int currentItemSelected) {
    _currentItemSelected = currentItemSelected;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color color) {
    _backgroundColor = color;
  }

  Color get activeColor => _activeColor;
  set activeColor(Color color) {
    _activeColor = color;
  }

  Color get inactiveColor => _inactiveColor;
  set inactiveColor(Color color) {
    _inactiveColor = color;
  }
}
