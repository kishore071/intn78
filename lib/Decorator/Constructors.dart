import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class InitialRes {
  late String message;
  late int num;
  late String Gen;
  late String Last;
  late String regno;
  InitialRes(
      {required this.message,
      required this.num,
      required this.Gen,
      required this.Last,
      required this.regno});
}

class FinalRes{
  late String Caste;
  late String Religion;
  late String Hobbies;
  late String Languages;
  late String Pre_job_loc;
  late String soc_med;
  late String Car_obj;
  FinalRes(
  {
  required this.Caste,
  required this.Religion,
  required this.Hobbies,
  required this.Languages,
  required this.Pre_job_loc,
  required this.soc_med,
  required this.Car_obj,
  });}


class XdTest {
  String? name;
  DateTime? date;

  XdTest({required this.name, required this.date});

  factory XdTest.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) {
    final data=json.data()!;
    return XdTest(
      name: data['name'],
      date: DateTime.parse(data['birthday']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data!['name'] = name;
    data!['date'] = date?.toIso8601String();
    return data;
  }
}

//needed parametrs to be passed for uid and
class Usersxd{
  late final String uid;
  Usersxd({required this.uid });
}

//End of Constructs

//DropDowns
DropdownMenuItem<String> buildMenuItem(String listitem)=>DropdownMenuItem(
  value:listitem,
  child: Text(listitem,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),);

DropdownMenuItem<String> buildMenuItems(String listitemx)=>DropdownMenuItem(
  value:listitemx,
  child: Text(listitemx,style:const TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),);

DropdownMenuItem<String> buildMenuItemsx(String listitems)=>DropdownMenuItem(
  value:listitems,
  child: Text(listitems,style:const TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),);

//End Of DropDown
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

