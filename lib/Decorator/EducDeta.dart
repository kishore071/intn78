import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern78/Decorator/constants.dart';
import 'Constructors.dart';

class AddressField extends StatefulWidget {
  const AddressField({Key? key}) : super(key: key);

  @override
  State<AddressField> createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  bool _10value = false;
  bool _12value = false;
  bool _degvalue = false;
  bool _dipvalue = false;

  List<DateTimeRange> dateRanges = [];
  int range=0;
  String valuesx='';
  String? value;
  String? value1;
  String? value3;
  int rang=0;
  @override
  Widget build(BuildContext context) {
    List<String> educationDegrees = [
      'B.Ed',
      'M.Ed',
      'Ph.D. in Education',
      'Ed.D.',
      'B.A. Ed',
      'B.S. Ed',
      'M.A. Ed',
      'M.S. Ed',
      'B.ECE',
      'M.ECE',
      'B.Sp.Ed',
      'M.Sp.Ed',
      'B.P.Ed',
      'M.P.Ed',
      'B.Tech Ed',
      'M.Tech Ed',
    ];
    List<String> educationDegreesx = [
      'Bachelor of Education (B.Ed)', 'Master of Education (M.Ed)', 'Doctor of Philosophy in Education (Ph.D.)', 'Doctor of Education (Ed.D.)',
      'Bachelor of Arts in Education (B.A. Ed)', 'Bachelor of Science in Education (B.S. Ed)', 'Master of Arts in Education (M.A. Ed)',
      'Master of Science in Education (M.S. Ed)', 'Bachelor of Early Childhood Education (B.ECE)', 'Master of Early Childhood Education (M.ECE)',
      'Bachelor of Special Education (B.Sp.Ed)', 'Master of Special Education (M.Sp.Ed)', 'Bachelor of Physical Education (B.P.Ed)', 'Master of Physical Education (M.P.Ed)',
      'Bachelor of Technology in Education (B.Tech Ed)', 'Master of Technology in Education (M.Tech Ed)',];
    int finder(String items){
      for (int i=0;i<=educationDegrees.length-1;i++){
        if(educationDegrees.elementAt(i)==items){
          rang=i;
        }
      }
      return rang;
    }
    List<String> listitem = ['CBSE', 'CISCE', 'NIOS', 'BSEAP', 'AHSEC', 'BSEB', 'CGBSE', 'GBSHSE',
      'GSEB', 'BSEH', 'HPBOSE', 'JKBOSE', 'JAC', 'KSEEB', 'KBPE', 'MSBSHSE', 'BSEM',
      'MBOSE', 'MBSE', 'NBSE', 'CHSE', 'PSEB', 'RBSE', 'TNBSE', 'TSBIE', 'TBSE', 'UPMSP', 'UBSE', 'WBCHSE',];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              field('10th Class'),
              Checkbox(
                value: _10value,
                checkColor: Colors.blue,
                activeColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _10value = value!;
                    if(_10value){
                      range++;
                      //print(range);
                    }
                    else if(_10value==false){
                      range--;
                      //print(range);
                    }
                  });
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.32,
              ),
              field('12th Class'),
              Checkbox(
                value: _12value,
                checkColor: Colors.blue,
                activeColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _12value = value!;
                    if(_12value){
                      range++;
                      //print(range);
                    }
                    else if(_12value==false){
                      range--;
                      //print(range);
                    }
                  });
                },
              ),
            ]),
          Row(
            children:[
              field('Diploma'),
              Checkbox(
                value: _dipvalue,
                checkColor: Colors.blue,
                activeColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _dipvalue = value!;
                  });
                  if(_dipvalue){
                    range++;
                    //print(range);
                  }
                  else if(_dipvalue==false){
                    range--;
                    //print(range);
                  }
                },
              ),
              Checkbox(
                value: _degvalue,
                checkColor: Colors.blue,
                activeColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    _degvalue = value!;
                    if(_degvalue){
                      range++;
                      //print(range);
                    }
                    else if(_degvalue==false){
                      range--;
                      //print(range);
                    }
                  });
                },
              ),
            ],
          ),
          if (_10value) ...[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(vertical: 1.0),
              child: Column(
                children: <Widget>[
                  field('10th Class'),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'School Name'),
                    validator: (value) =>
                    value!.isEmpty ? 'Enter Details Properly' : null,
                  ),
                  Box(context),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Marks(%)'),
                    validator: (value) =>
                    value!.isEmpty ? 'Enter Details Properly or Include %' : null,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        pickDateRange();
                      },
                      child: field(getFormattedDateRange(0)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: value1,
                            hint: field('Board'),
                            items: listitem.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() => value1 = value),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                            contentPadding: const EdgeInsets.symmetric(vertical: 4),
                            labelText: 'PinCode',
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
          if (_12value) ...[
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
            child:Column(children:[
            field("12th Class"),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'School Name'),
              validator: (value) =>
              value!.isEmpty ? 'Enter Details Properly' : null,
            ),
            Box(context),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Marks(%)'),
              validator: (value) =>
              value!.isEmpty ? 'Enter Details Properly or if not Include %' : null,
            ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pickDateRange();
                    },
                  child: field(getFormattedDateRange(1)),
                ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: field('Board'),
                    value: value3,
                    items: listitem.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() => value3 = value),
                  ),
              ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: textInputDecoration.copyWith(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4),
                      labelText: 'PinCode',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
          ])
            )],
          if (_degvalue) ...[
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(vertical: 1.0),
            child:Column(
            children:[
            field("Degree Class"),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'University Name'),
              validator: (value) =>
              value!.isEmpty ? 'Enter Details Properly' : null,
            ),
            Box(context),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Marks(%)'),
              validator: (value) =>
              value!.isEmpty ? 'Enter Details Properly or if not Include %' : null,
            ),
            ElevatedButton(
              onPressed: () {
                pickDateRange();
              },
              child: field(getFormattedDateRange(_dipvalue?3:2)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 108,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: value,
                    hint: field('Select Degree'),
                    items: educationDegrees.map(buildMenuItem).toList(),
                    onChanged: (value) =>
                        setState(() {
                          this.value = value;
                        if(value!=null){
                          valuesx=value;
                        }
                        }),
                  ),
                ),
              ),
            ),
            if(valuesx.isNotEmpty)...[
              field(educationDegreesx[finder(valuesx)]),
              ],
            Column(
              children: [
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: 'PinCode',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),]))
          ],
          ElevatedButton(onPressed: (){
            setState(() {
              Navigator.pushNamed(context, '/projandint');
            });
          }, child: field("Switch"))
        ],
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime(2022, 11, 5),
        end: DateTime(2022, 12, 5),
      ),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year),
    );

    if (newDateRange == null) {
      return;
    } else {
      setState(() {
        dateRanges.add(newDateRange);
      });
    }
  }

  String getFormattedDateRange(int index) {
    if (index >= dateRanges.length) return 'Select Date Range';
    final start = dateRanges[index].start;
    final end = dateRanges[index].end;

    return '${start.year}/${start.month} - ${end.year}/${end.month}';
  }
}
