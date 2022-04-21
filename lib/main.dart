import 'package:flutter/material.dart';
import 'package:text_style/login.dart';
import 'package:text_style/menu_apps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuApps(),
    );
  }
}
