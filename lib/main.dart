import 'package:flutter/material.dart';
import 'package:pelis_app/config/theme/app_theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes not App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child:FilledButton.tonal(onPressed: () {}, child: const Text("clck me"))
        ),
      ),
    );
  }
}