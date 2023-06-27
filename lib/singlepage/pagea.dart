// import 'package:flutter/material.dart';
// import 'package:intern78/Stepper/StepFirste.dart';
// import 'package:intern78/Stepper/Steps.dart';
//
// class Pagea extends StatefulWidget {
//   const Pagea({super.key});
//
//   @override
//   State<Pagea> createState() => _PageaState();
// }
//
// class _PageaState extends State<Pagea> {
//   int _currentstep=0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:AppBar(title: const Text("Navigator 1st"),
//           leading:Image.asset('assets/img/Easwari_Engineering_College_logo.png',fit: BoxFit.contain,),),
//       body: SingleChildScrollView(
//         child:Theme(
//           data: Theme.of(context).copyWith(primaryColor: Colors.blue),
//           child: Stepper(
//                 type: StepperType.vertical,
//                 steps: getSteps(),
//               currentStep: _currentstep,
//             onStepContinue: (){
//                   if(_currentstep>=0 && _currentstep<getSteps().length-1){
//                     setState(() {
//                       _currentstep++;
//                     });
//             }},
//             onStepCancel: (){
//                   setState(() {
//                     if(_currentstep>0){
//                     _currentstep--;
//                   }});
//             },
//             onStepTapped: (step)=>setState(()=>_currentstep=step),
//
//           ),
//         ),
//       ),
//     );
//   }
//   List <Step> getSteps()=>[
//     Step(state: _currentstep>0?StepState.complete:StepState.indexed,
//         isActive: _currentstep >=0,
//         title: const Text("data 1"), content: const Steps()),
//     Step(state: _currentstep>1?StepState.complete:StepState.indexed,
//         isActive:_currentstep>=1,
//         title: const Text("data 2"), content: const StepFirste(),),
//     Step(state: _currentstep>2?StepState.complete:StepState.indexed,
//         isActive:_currentstep>=2,
//         title: const Text("data 3"), content: const StepFirste()),
//
//   ];
// }

