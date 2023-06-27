// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intern78/Decorator/constants.dart';

import '../Decorator/Constructors.dart';
class AdditionalPage extends StatefulWidget {
  const AdditionalPage({super.key});

  @override
  _AdditionalPageState createState() => _AdditionalPageState();

}

class _AdditionalPageState extends State<AdditionalPage> {
  final _formKey = GlobalKey<FormState>();
  late String _hobbies='';
  late String _job = '';
  late String _carrier = '';
  late String _social = '';
  late String _lang = '';
  final listitemx=['General Category(GC)','Other Backward Class(OBC)','Scheduled Caste(SC)','Scheduled Tribe(ST)'];
  final listitems=['Hinduism','African Traditional & Diasporic','Agnostic','Atheist',"Baha'i",'Buddhism','Cao Dai','Chinese Traditional Religion','Christianity','Islam','Jainism','Juche','Judaism','Neo-Paganism','Non-Religious','Rastafarianism','Secular','Shinto','Sikhism','Spritism',"Tenrikyo",'Unitarian-Universalism','Zoroastrianism','Primal-Indigeneous','Others'];
  String? value;String? _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: field('Additional Page')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Box,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0,5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: value,
                        isExpanded: true,
                        hint: field('Caste'),
                        isDense: false,
                        items: listitemx.map(buildMenuItem).toList(),
                        onChanged:(value)=>
                            setState(()=>this.value=value)),
                  ),
                ),
                Box,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0,5),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value:_value,
                          isExpanded: true,
                          hint: field('Religion'),
                          isDense: false,
                          items: listitems.map(buildMenuItemsx).toList(),
                          onChanged:(value)=>
                              setState(()=>_value=value))
                  ),
                ),
                Box,
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Hobbies (what do you like?)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _hobbies = value!;
                  },
                ),
                Box,
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Languages'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lang = value!;
                  },
                ),
                Box,
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Preffered Job Locations '),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _job = value!;
                  },
                ),
                Box,
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Social Media'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _social = value!;
                  },
                ),
                Box,
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Carrier Objective '),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some information';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _carrier = value!;
                  },
                ),
                Box,
                ElevatedButton(
                  child: field('Review & Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // Perform any additional logic with the information
                      // For this example, we'll just print it
                      //print('Additional Information: $_information');
                      MyParams abv= MyParams(
                          Caste:value.toString(),
                          Religion: _value.toString(),
                          Hobbies: _hobbies,
                          Languages: _lang,
                          Pre_job_loc: _job,
                          soc_med: _social,
                          Car_obj: _carrier);
                      Navigator.pushNamed(context, '/seventh',arguments: abv);
                    }
                  },
                ),

              ],)
            ,)
          ,),
      )
      ,);
  }
}