import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MyParameters {
  late String message;
  late int num;
  late String Gen;
  late String Last;
  late String regno;
  MyParameters(
      {required this.message,
      required this.num,
      required this.Gen,
      required this.Last,
      required this.regno});
}

DropdownMenuItem<String> buildMenuItem(String listitem)=>DropdownMenuItem(
  value:listitem,
  child: Text(listitem,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),);

/*
class Dates {
  late DateTime datetime;
  late int year;
  Dates({required this.year, required this.datetime});
}
*/


class Errores extends StatelessWidget {
  const Errores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.error_outlined),
        title:const Text('Error In Passing'),
      ),backgroundColor: Colors.lightGreenAccent,
      body: const Center(
        child: Text('Error Pls Try Again',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}

