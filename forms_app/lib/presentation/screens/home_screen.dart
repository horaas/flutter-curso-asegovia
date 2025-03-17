import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Forms')),
           body: Column(
             children: [
               ListTile(
                title: Text('cubit counter'),
                trailing: Icon(FontAwesomeIcons.caretRight),
                onTap: () {
                  context.push('/cubit');
                },
               ),
               ListTile(
                title: Text('bloc counter'),
                trailing: Icon(FontAwesomeIcons.caretRight),
                onTap: () {
                  context.push('/bloc');
                },
               ),
               const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(),
               )
             ],
           ),
       );
  }
}