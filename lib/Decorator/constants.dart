
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),);}

FilteringTextInputFormatter format=FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z .]+$'));
const Text Errors = Text(
  "Value Not Received Correctly",
  style: TextStyle(
      fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
);
