import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Updates',
      home: HomeScreen(),
      theme: ThemeData(
        accentColor: Colors.indigoAccent,
        primaryColor: Colors.indigo[700],
      ),
    );
  }
}
