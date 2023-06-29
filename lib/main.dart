import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern78/Componenets/copy.dart';
import 'package:intern78/Decorator/Constructors.dart';
import 'package:intern78/Decorator/MyWidget.dart';
import 'package:intern78/Services/authservice.dart';
import 'package:intern78/singlepage/AdditionalPage.dart';
import 'package:intern78/singlepage/FilePicker.dart';
import 'package:intern78/singlepage/First.dart';
import 'package:intern78/singlepage/Second.dart';
import 'package:provider/provider.dart';
import 'Output/Intializer.dart';
import 'singlepage/ProjectAndIntern.dart';
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usersxd?>.value(
      catchError: (_,__)=>null,
      value: AuthService().users,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) =>const Second(),
          '/test':(context)=>const Snapshots(),
          '/laf': (context) =>const First(),
          '/edudeta':(context)=>const MyWidget(),
          '/projandint':(context)=>const ProjectAndIntern(),
          '/workexp':(context)=>const SecondPage(),
          '/profdoc':(context)=>const FilesPivckers(),
          '/adddetails':(context)=>const AdditionalPage(),
        },
      ),
    );
  }
}
