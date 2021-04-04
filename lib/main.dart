import 'package:flutter/material.dart';
import 'package:notes/views/homescreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
