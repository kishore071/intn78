import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

//TextForm field Design

const textInputDecoration=InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.grey,width: 2.0),),
  focusedBorder: OutlineInputBorder
    (borderSide: BorderSide(
      color: Colors.blue,width: 2.0)),
);

//Text Calendar Design

const textcalendar=InputDecoration(
    icon: Icon(Icons.calendar_today),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.grey,width: 2.0),),
  focusedBorder: OutlineInputBorder
    (borderSide: BorderSide(
      color: Colors.blue,width: 2.0)),
);

//EqualGap
const Box=SizedBox(height: 30,);
const Boxe=SizedBox(width: 110,);
//TextCreator
field(String vra){
  return Text(vra,style: const TextStyle(
      fontSize: 18.8,
      fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),);}

FilteringTextInputFormatter format=FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z .]+$'));

//Error Display Texts
const Text Errors = Text(
  "Value Not Received Correctly",
  style: TextStyle(
      fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
);

//TextFormField Control


//File Picker Constants free....
Future<File> saveFilePermanently(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  print(appStorage.path);
  final newFile = File('${appStorage.path}/${file.name}');
  return File(file.path!).copy(newFile.path);
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path!);
}

// Future pickDateRange(DateTimeRange dateTimeRange, BuildContext context)async{
//   DateTimeRange? newDateRange = await showDateRangePicker(
//     context: context,
//     initialDateRange: dateTimeRange,
//     firstDate: DateTime(DateTime.now().year-100),
//     lastDate: DateTime(DateTime.now().year),
//   );
//   if(newDateRange==null) {
//     return;
//   } else {
//     setState(() {
//       dateTimeRange=newDateRange;
//     });
//   }  }
