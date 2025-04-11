import 'package:disenos_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('data')),
      body: const _ListOptions(),
      drawer: const _DrawarIcon(),
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
      itemCount: routes.length,
      separatorBuilder:
          (BuildContext context, int index) =>
              const Divider(color: Colors.blueAccent),
      itemBuilder:
          (BuildContext context, int index) => ListTile(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => routes[index].page,));
            },
            leading: FaIcon(
              routes[index].icon,
              color: Colors.blueAccent,
            ),
            title: Text(routes[index].title),
            trailing: const FaIcon(
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
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 150,
              child: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  'AR',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              
            ),
          ),
          const Expanded(
            child: _ListOptions(),
          ),
          ListTile(
            onTap: () {},
            leading: const FaIcon(
              FontAwesomeIcons.moon,
              // FontAwesomeIcons.sun,
              color: Colors.blueAccent,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              activeColor: Colors.blueAccent,
              value: true, onChanged: (value) {
              
            },),
          ),
          ListTile(
            onTap: () {},
            leading: const FaIcon(
              FontAwesomeIcons.fillDrip,
              color: Colors.blueAccent,
            ),
            title: const Text('Theme'),
            trailing: Switch.adaptive(
              activeColor: Colors.blueAccent,
              value: true, onChanged: (value) {
              
            },),
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
