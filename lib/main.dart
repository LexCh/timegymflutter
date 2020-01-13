import 'package:flutter/material.dart';
import 'package:gymapp/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
            home: HomePage(),
    );
  }
}

