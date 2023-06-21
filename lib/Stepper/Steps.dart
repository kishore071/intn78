import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Decorator/constants.dart';

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  TextEditingController dateinput= TextEditingController();
  late String valueChosse;
  late String errordetails="";
  late String pwd='';
  late String email='';
  final listitem=['Male','Female','TransGender',"binary",'non binary','genderqueer','agender','bigender','genderfluid','two-fluid','androgynous','demi-gender','neutrois','pangender','third gender','transmasculine','transfeminine','gender questioning','otherkin'];
  String? value;
  int? nums;
  //final _formkey=GlobalKey<FormState>();
  @override
  void initState(){
    DateTime num=DateTime.now();
    nums=num.year;
    //print(nums);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children:<Widget> [
              Box,
              TextFormField(
                decoration: textInputDecoration.copyWith(labelText:'First Name(*)'),
                validator: (val)=>val!.isEmpty?'Enter An Crct Email':null,
                onChanged:(val){
                  setState(() {
                    email=val;
                  });
                } ,
              ),
              Box,
              TextFormField(
                decoration: textInputDecoration.copyWith(labelText:'Last Name(*)' ),
                validator: (val)=>val!.isEmpty?'Enter Pwd Correctly':null,
                onChanged: (val){
                  setState(() {
                    pwd=val;
                  });
                },
              ),
              Box,
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 78,5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      value: value,
                      isExpanded: true,
                      isDense: true,
                      items: listitem.map(buildMenuItem).toList(),
                      onChanged:(value)=>
                      setState(()=>this.value=value)),
                ),
              ),
              Box,
              TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: textcalendar.copyWith(hintText: 'Enter Date:',labelText: 'Date Of Birth:'),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1800),
                        lastDate: DateTime(nums!),
                    );

                    if(pickedDate != null ){
                      print(pickedDate);
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(formattedDate);
                      setState(() {
                        dateinput.text = formattedDate;
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },),

              Text(errordetails),
              Padding(padding: const EdgeInsets.fromLTRB(85, 10, 85, 0),
                  child:ElevatedButton(onPressed: (){
                    setState(() {
                      if(email.isNotEmpty&&pwd.isNotEmpty){
                        print("email == $email \n pwd == $pwd");
                      }else{
                        errordetails=" Enter Details Correctly ";
                      }
                    });
                  }, child: const Text("Print in Console",
                    strutStyle: StrutStyle(fontSize: 20),)))
            ],
          ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String listitem)=>DropdownMenuItem(
      value:listitem,
    child: Text(listitem,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),);
}
