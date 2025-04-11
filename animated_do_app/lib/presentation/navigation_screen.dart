import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          'Navigation page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: _FloatingButton(),
      bottomNavigationBar: _BottomNavigation(),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.redAccent,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone),
            label: 'Bone'
        ),
        BottomNavigationBarItem(
            label: 'Notification',
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle
                    ),
                    child: Text('10', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 9),),
                  ),
                )
              ],
            ),
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog),
            label: 'Dog'
        ),
      ],
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.redAccent,
      onPressed: () {},
      child: FaIcon(FontAwesomeIcons.play, color: Colors.white),
    );
  }
}
