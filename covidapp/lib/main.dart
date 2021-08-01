import 'package:covidapp/ui/home.dart';
import 'package:covidapp/ui/login.dart';
import 'package:flutter/material.dart';

// @dart=2.9
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covidapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Login(),
    );
  }
}
