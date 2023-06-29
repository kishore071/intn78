import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern78/Services/Database.dart';
import 'package:intern78/Services/authservice.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Decorator/Constructors.dart';
import '../Decorator/constants.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final AuthService _authService=AuthService();
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
  late TextEditingController _pincode1 = TextEditingController();
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
    final user=Provider.of<Usersxd?>(context);
    final DatabaseService database=DatabaseService(userid: user!.uid);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Navigator 1st"),
        leading: Image.asset(
          'assets/img/Easwari_Engineering_College_logo.png',
          fit: BoxFit.contain,
        ),
        actions: <Widget>[
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.add)),
          TextButton.icon(onPressed: ()async{
            await _authService.signout();
          },
              icon:const Icon(Icons.output),
              label: field('Logout'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Box(context),
            TextFormField(
              controller: emailed,
              decoration: textInputDecoration.copyWith(labelText: 'First Name(*)'),
              inputFormatters: [format],
              validator: (val) => val!.isEmpty ? 'Enter An Crct Email' : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                  email = emailed.text;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _regno,
              decoration: textInputDecoration.copyWith(labelText: 'Registration No(*)'),
              onTap: () {
                setState(() {
                  _regno = _regno;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Row(
              children: <Widget>[
                Text(
                  'Enter Ur Gender:',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: field('Gender'),
                  value: value,
                  isExpanded: true,
                  dropdownColor: Colors.white60,
                  items: listitem.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextField(
              controller: dateinput,
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
                  if (pickedDate.year <= DateTime.now().year) {
                    if (pickedDate.month <= DateTime.now().month) {
                      if (pickedDate.day <= DateTime.now().day) {
                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      }
                    }
                  }
                } else {
                  return;
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                field('Contact Details'),
              ],
            ),
            TextFormField(
              controller: _secondary,
              decoration: textInputDecoration.copyWith(labelText: 'Primary Email Address(*)'),
              onTap: () {
                setState(() {
                  _secondary = _secondary;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _email,
              decoration: textInputDecoration.copyWith(labelText: 'Secondary Email Address(*)'),
              onTap: () {
                setState(() {
                  _email = _email;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _phone,
              decoration: textInputDecoration.copyWith(labelText: 'Phone No(*)'),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onTap: () {
                setState(() {
                  _phone = _phone;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                field('Permanent Address'),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                field('Country (*)'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                field('Pin code(*)'),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value,
                      items: listitem.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value,
                      items: listitem.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value,
                      items: listitem.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                field('Temporary Address'),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Checkbox(
                  value: _value,
                  checkColor: Colors.blue,
                  activeColor: Colors.black,
                  onChanged: (bool? value) {
                    setState(() {
                      _value = value!;
                      if (value) {
                        setState(() {
                          _temp.text = _per.text;
                          _temp1.text = _per2.text;
                          _pincode.text = _pincode1.text;
                        });
                      } else {
                        _temp.clear();
                        _temp1.clear();
                        _pincode1.clear();
                      }
                    });
                  },
                ),
                field('Same as Primary Address'),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            TextFormField(
              controller: _temp,
              decoration: textInputDecoration.copyWith(labelText: 'Address 1(*)'),
              onTap: () {
                setState(() {
                  _temp = _temp;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _temp1,
              decoration: textInputDecoration.copyWith(labelText: 'Address 2(*)'),
              onTap: () {
                setState(() {
                  _temp1 = _temp1;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                field('Country (*)'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                field('Pin code(*)'),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value,
                      items: listitem.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: TextFormField(
                    controller: _pincode1,
                    decoration: textInputDecoration.copyWith(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      labelText: 'PinCode',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onTap: () {
                      setState(() {
                        _pincode1 = _pincode1;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value,
                      items: listitem.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: value,
                      items: listitem.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  // if(email.isNotEmpty&&pwd.isNotEmpty){
                  //   email=emailed.text;
                  //   //print("email == $email \n pwd == $pwd");
                  // MyParameters para=MyParameters(message: email, Last:_lastname.text,
                  //     Gen:value.toString(), num:int.parse(dateinput.text),regno:_regno.text);
                  // Navigator.pushNamed(context,'/laf',arguments:para);
                  // }else{
                  //   errordetails=" Enter Details Correctly ";
                  // }
                });
              }, child: field('Save & Continue'),style:
                ElevatedButton.styleFrom(
                  foregroundColor: Colors.greenAccent,
                  backgroundColor: Colors.grey.shade600,
                  elevation: 0.0,

                ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ElevatedButton(onPressed: (){
              setState(()  {
                if(email.isNotEmpty){
                  setState(() async{
                  await database.InitialData(email);
                  Navigator.pushNamed(context, '/test');});
                }});
            }, child: field('Switch'),style: ElevatedButton.styleFrom(
              foregroundColor: Colors.greenAccent,
              backgroundColor: Colors.grey.shade600,
              elevation: 0.0,
            ),)
          ],
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}
