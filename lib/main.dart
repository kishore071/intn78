import 'package:flutter/material.dart';
import 'package:intern78/Decorator/MyWidget.dart';
import 'package:intern78/singlepage/First.dart';
import 'package:intern78/singlepage/Second.dart';
import 'package:intern78/singlepage/pagea.dart';
import 'singlepage/FilePicker.dart';
//import 'package:intern78/singlepage/Third.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>const First(),
        '/laf': (context) => Second(),
      },
    );
  }
}
