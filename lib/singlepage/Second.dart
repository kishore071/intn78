import 'package:flutter/material.dart';
import '../Decorator/constants.dart';
import '../Decorator/Constructors.dart';
class Second extends StatelessWidget {
  Second({super.key,});
  late String emailed;
  late int num;
  late String Gen;
  late String Last;
  late String regno;
  // void initState(){
  //   //print('enabled');
  // }
  @override
  Widget build(BuildContext context) {
    bool conf;
    final MyParameters? parameters = ModalRoute.of(context)!.settings.arguments as MyParameters?;
    if(parameters!=null){
      emailed=parameters.message;
      regno=parameters.regno;
      num=parameters.num;
      Gen=parameters.Gen;
      Last=parameters.Last;
      conf=emailed.isNotEmpty&&num!=0&&Gen.isNotEmpty&&Last.isNotEmpty&&regno.isNotEmpty;
    }
    else{
      conf=false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(emailed),
      ),
      body: conf ?
      Column(
        children:<Widget>[
          Text(emailed),
          Text(Last),
          Text(num as String),
          Text(regno),
          Text(Gen)
        ],
      ):const Errores(),

    );
  }
}
