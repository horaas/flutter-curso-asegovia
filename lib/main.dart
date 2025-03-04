import 'package:flutter/material.dart';
import 'package:pelis_app/config/theme/app_theme.dart';
import 'package:pelis_app/presentation/providers/discover_provider.dart';
import 'package:pelis_app/presentation/screens/discover/discover_escreen.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextVideo()
          )
      ],
      child: MaterialApp(
        title: 'tok tik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const Scaffold(
          body: DiscoverScreen(),
        ),
      ),
    );
  }
}