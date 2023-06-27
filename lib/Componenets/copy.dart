import 'package:flutter/material.dart';
import 'package:intern78/Decorator/constants.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  String _information = '';
  DateTimeRange dateRaneg=DateTimeRange(
      start: DateTime(2022,11,5),
      end: DateTime(2022,12,5));
  @override
  Widget build(BuildContext context) {
    final start=dateRaneg.start;
    final end=dateRaneg.end;
    final diff=dateRaneg.duration;
    return Scaffold(
      appBar: AppBar(
        title: const Text('fourth Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Job title'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _information = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Company Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _information = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // Perform any additional logic with the information
                      // For this example, we'll just print it
                      print('Additional Information: $_information');
                      Navigator.pop(context);
                    }
                  },
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Expanded(child:
                    ElevatedButton(onPressed: (){
                      setState(() {
                        pickDateRange(dateRaneg);
                      });
                      }, child: field('${start.year}/${start.month}/${start.day}'))),
                    const SizedBox(width:12),
                    Expanded(child:
                    ElevatedButton(onPressed:(){
                      setState(() {
                        pickDateRange(dateRaneg);
                      });
                    },child: field('${end.year}/${end.month}/${end.day}'))),
                  ],
                ),field('No of Days:${diff.inDays}'),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Job Descripition'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _information = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Skills Utilised/Gained '),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _information = value!;
                  },
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushReplacementNamed(context, '/profdoc');
                  });
                }, child: field('Switch'))
              ],)
            ,)
          ,),
      )
      ,);
  }
  Future pickDateRange(DateTimeRange dateTimeRange)async{
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRaneg,
        firstDate: DateTime(DateTime.now().year-100),
        lastDate: DateTime(DateTime.now().year),
    );
    if(newDateRange==null) {
      return;
    } else {
      setState(() {
        dateRaneg=newDateRange;
      });
    }  }
}