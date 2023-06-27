import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../Decorator/constants.dart';
import '../Decorator/Constructors.dart';
class StepFirste extends StatefulWidget {
  const StepFirste({super.key});

  @override
  State<StepFirste> createState() => _StepFirsteState();
}

class _StepFirsteState extends State<StepFirste> {
  TextEditingController dateinput = TextEditingController();
  bool _value = false;
  late String errordetails = "";
  int year = DateTime.now().year;
  late final TextEditingController _lastname = TextEditingController();
  late TextEditingController emailed = TextEditingController();
  late TextEditingController _regno = TextEditingController();
  late TextEditingController _secondary = TextEditingController();
  late TextEditingController _email = TextEditingController();
  late TextEditingController _phone = TextEditingController();
  late TextEditingController _per = TextEditingController();
  late TextEditingController _per2 = TextEditingController();
  late TextEditingController _temp = TextEditingController();
  late TextEditingController _temp1 = TextEditingController();
  late TextEditingController _pincode = TextEditingController();
  late final TextEditingController _pincode1 = TextEditingController();
  late String pwd = '';
  late String email = '';
  final listitem = [
    'Male',
    'Female',
    'TransGender',
    "binary",
    'non binary',
    'genderqueer',
    'agender',
    'bigender',
    'genderfluid',
    'two-fluid',
    'androgynous',
    'demi-gender',
    'neutrois',
    'pangender',
    'third gender',
    'transmasculine',
    'transfeminine',
    'gender questioning',
    'otherkin'
  ];
  String? value;
  late int years;

  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    years = dateTime.year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Box,
          TextFormField(
            controller: emailed,
            decoration: textInputDecoration.copyWith(
                labelText: 'First Name(*)'),
            inputFormatters: [format],
            validator: (val) => val!.isEmpty ? 'Enter An Crct Email' : null,
            onChanged: (val) {
              setState(() {
                email = val;
                email = emailed.text;
              });
            },
          ),
          Box,
          TextFormField(
            controller: _lastname,
            decoration: textInputDecoration.copyWith(labelText: 'Last Name(*)'),
            inputFormatters: [format],
            validator: (val) => val!.isEmpty ? 'Enter Pwd Correctly' : null,
            onTap: () {},
            onChanged: (val) {
              setState(() {
                pwd = val;
                pwd = _lastname.text;
              });
            },
          ),
          Box,
          TextFormField(
            controller: _regno,
            decoration: textInputDecoration.copyWith(
                labelText: 'Registration No(*)'),
            onTap: () {
              setState(() {
                _regno = _regno;
              });
            },
          ),
          const Row(
            children: <Widget>[
              Text('Enter Ur Gender:', style: TextStyle(fontSize: 15),),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(8)),),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  hint: field('Enter Ur Gender:'),
                  value: value,
                  isExpanded: true,
                  items: listitem.map(buildMenuItem).toList(),
                  onChanged: (value) =>
                      setState(() => this.value = value)),
            ),
          ),
          Box,
          TextField(
            controller: dateinput, //editing controller of this TextField
            decoration: textcalendar.copyWith(labelText: 'Date Of Birth:'),
            readOnly: true,
            onTap: () async {
              int oldyear = years - 100;
              int predyera = years + 1;
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(oldyear),
                lastDate: DateTime(predyera),
              );
              if (pickedDate != null) {
                //print(pickedDate);
                if (pickedDate.year <= DateTime
                    .now()
                    .year) {
                  if (pickedDate.month <= DateTime
                      .now()
                      .month) {
                    if (pickedDate.day <= DateTime
                        .now()
                        .day) {
                      String formattedDate = DateFormat('dd-MM-yyyy').format(
                          pickedDate);
                      //print(formattedDate);
                      setState(() {
                        dateinput.text = formattedDate;
                      });
                    }
                  }
                }
              } else {
                return;
                //print("Date is not selected");
              }
            },),
          Box,
          Row(
            children: [
              field('Contact Details')],),
          TextFormField(
            controller: _secondary,
            decoration: textInputDecoration.copyWith(
                labelText: 'Primary Email Address(*)'),
            onTap: () {
              setState(() {
                _secondary = _secondary;
              });
            },
          ),
          TextFormField(
            controller: _email,
            decoration: textInputDecoration.copyWith(
                labelText: 'Secondary Email Address(*)'),
            onTap: () {
              setState(() {
                _email = _email;
              });
            },
          ),
          TextFormField(
            controller: _phone,
            decoration: textInputDecoration.copyWith(labelText: 'Phone No(*)'),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            onTap: () {
              setState(() {
                _phone = _phone;
              });
            },
          ), Row(children: [field('Permanent Address'),],),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _per,
            decoration: textInputDecoration.copyWith(labelText: 'Address 1(*)'),
            onTap: () {
              setState(() {
                _per = _per;
                if (_value) {
                  _temp.text = _per.text;
                }
              });
            },
          ), Box,
          TextFormField(
            controller: _per2,
            decoration: textInputDecoration.copyWith(labelText: 'Address 2(*)'),
            onTap: () {
              setState(() {
                _per2 = _per2;
                if (_value) {
                  _temp1.text = _per2.text;
                }
              });
            },
          ),
          Row(children: [
            field('Country (*)'),
            Boxe,
            field('Pin code(*)')
          ],),
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: value,
                    items: listitem.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => this.value = value)),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: value,
                    items: listitem.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => this.value = value)),
              ),
            ],
          ),
          Box,
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: value,
                    items: listitem.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => this.value = value)),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: value,
                    items: listitem.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => this.value = value)),
              ),
            ],
          ),
          Box,
          Row(children: [
            field('Temporary Address'),
          ],),
          Row(
            children: [
              Boxe,
              Checkbox(value: _value,
                  checkColor: Colors.blue,
                  activeColor: Colors.black,
                  onChanged: (bool ?value) {
                    setState(() {
                      _value = value!;
                      if (value) {
                        setState(() {
                          _temp.text = _per.text;
                          _temp1.text = _per2.text;
                        });
                      } else {
                        _temp.clear();
                        _temp1.clear();
                      }
                    });
                  }),
              field('Same as Primary Address'),
            ],
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: _temp,
            decoration: textInputDecoration.copyWith(labelText: 'Address 1(*)'),
            onTap: () {
              setState(() {
                _temp = _temp;
              });
            },
          ), TextFormField(
            controller: _temp1,
            decoration: textInputDecoration.copyWith(labelText: 'Address 2(*)'),
            onTap: () {
              setState(() {
                _temp1 = _temp1;
              });
            },
          ), Box,
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: value,
                  items: listitem.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: TextFormField(
                  controller: _pincode,
                  decoration: textInputDecoration.copyWith(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    labelText: 'PinCode',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onTap: () {
                    setState(() {
                      _pincode = _pincode;
                    });
                  },
                ),
              ),
            ],
          ),
          Box,
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: value,
                    items: listitem.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => this.value = value)),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: value,
                    items: listitem.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => this.value = value)),
              ),
            ],
          ),
          Text(errordetails),
          Box,
          Padding(padding: const EdgeInsets.fromLTRB(85, 10, 85, 0),
              child: ElevatedButton(onPressed: () {
                setState(() {
                  // if(email.isNotEmpty&&pwd.isNotEmpty){
                  //   email=emailed.text;
                  //   //print("email == $email \n pwd == $pwd");
                  MyParameters para = MyParameters(message: email,
                      Last: _lastname.text,
                      Gen: value.toString(),
                      num: int.parse(dateinput.text),
                      regno: _regno.text);
                  Navigator.pushNamed(context, '/laf', arguments: para);
                  // }else{
                  //   errordetails=" Enter Details Correctly ";
                  // }
                });
              }, child: field('Save&Continue'))),
        ],
      ),
    );
  }
}