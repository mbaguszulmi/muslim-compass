import 'package:flutter/material.dart';
import 'themes/colorTheme.dart' as Theme;
import 'mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim Compass',
      theme: Theme.mcThemeData,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
