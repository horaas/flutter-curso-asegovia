import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data')),
      body: _ListOptions(),
      drawer: _DrawarIcon(),
    );
  }
}

class _ListOptions extends StatelessWidget {
  const _ListOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder:
          (BuildContext context, int index) =>
              Divider(color: Colors.blueAccent),
      itemBuilder:
          (BuildContext context, int index) => ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.slideshare,
              color: Colors.blueAccent,
            ),
            title: Text('data'),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.blueAccent,
            ),
          ),
    );
  }
}

class _DrawarIcon extends StatelessWidget {
  const _DrawarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 150,
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  'AR',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              
            ),
          ),
          Expanded(
            child: _ListOptions(),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.moon,
              // FontAwesomeIcons.sun,
              color: Colors.blueAccent,
            ),
            title: Text('Dark Mode'),
            trailing: Switch.adaptive(
              activeColor: Colors.blueAccent,
              value: true, onChanged: (value) {
              
            },),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.fillDrip,
              color: Colors.blueAccent,
            ),
            title: Text('Theme'),
            trailing: Switch.adaptive(
              activeColor: Colors.blueAccent,
              value: true, onChanged: (value) {
              
            },),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
