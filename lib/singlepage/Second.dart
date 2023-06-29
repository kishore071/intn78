import 'package:flutter/material.dart';
import 'package:intern78/Decorator/Constructors.dart';
import 'package:intern78/Stepper/StepFirste.dart';
import 'package:intern78/singlepage/First.dart';
import 'package:provider/provider.dart';
class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<Usersxd?>(context);
    //print(user);
    if(user==null) {
      return const StepField();
    }
  else{
    return const First();
    }
  }
}
