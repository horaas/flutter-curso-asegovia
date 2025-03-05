import 'package:flutter/material.dart';
import 'package:pelis_app/config/routes/app-router.dart';
import 'package:pelis_app/config/theme/app_theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      );

  }
}