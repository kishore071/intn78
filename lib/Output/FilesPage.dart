import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Decorator/Constructors.dart';
class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    final InitalLoad=Provider.of<List<XdTest>?>(context);
    InitalLoad?.forEach((element) {
      print(element.name);
      print(element.date);
    });
    return Container();
  }
}
