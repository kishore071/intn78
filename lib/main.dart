import 'package:flutter/material.dart';
import 'package:intern78/Componenets/copy.dart';
import 'package:intern78/Decorator/MyWidget.dart';
import 'package:intern78/singlepage/AdditionalPage.dart';
import 'package:intern78/singlepage/FilePicker.dart';
import 'package:intern78/singlepage/First.dart';
import 'package:intern78/singlepage/Second.dart';

import 'singlepage/ProjectAndIntern.dart';

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
        '/edudeta':(context)=>const MyWidget(),
        '/projandint':(context)=>const ProjectAndIntern(),
        '/workexp':(context)=>const SecondPage(),
        '/profdoc':(context)=>const FilesPivckers(),
        '/adddetails':(context)=>const AdditionalPage(),
      },
    );
  }
}
