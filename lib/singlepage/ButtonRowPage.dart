import 'package:flutter/material.dart';
import 'package:intern78/Decorator/constants.dart';

class ButtonRowPage extends StatefulWidget {
  const ButtonRowPage({Key? key}) : super(key: key);

  @override
  _ButtonRowPageState createState() => _ButtonRowPageState();
}

class _ButtonRowPageState extends State<ButtonRowPage> {
  List<Widget> proj = [];
  int projind=0;
  List<TextEditingController> companyControllers = [];
  List<TextEditingController> projTitleControllers = [];
  List<TextEditingController> functControllers = [];
  List<TextEditingController> indusControllers = [];
  List<TextEditingController> desControllers = [];
  List<Widget> intern = [];
  List<TextEditingController> designationControllers = [];
  List<TextEditingController> companyNamesControllers = [];
  List<TextEditingController> functionControllers = [];
  List<TextEditingController> industryControllers = [];
  List<TextEditingController> descriptionControllers = [];
  List<TextEditingController> skillControllers = [];
  int interntow=0;

  @override
  void dispose() {
    for (var controller in companyControllers) {
      controller.dispose();
    }
    for (var controller in projTitleControllers) {
      controller.dispose();
    }
    for (var controller in functControllers) {
      controller.dispose();
    }
    for (var controller in indusControllers) {
      controller.dispose();
    }
    for (var controller in desControllers) {
      controller.dispose();
    }
    for (var controller in designationControllers) {
      controller.dispose();
    }
    for (var controller in companyNamesControllers) {
      controller.dispose();
    }
    for (var controller in functionControllers) {
      controller.dispose();
    }
    for (var controller in industryControllers) {
      controller.dispose();
    }
    for (var controller in descriptionControllers) {
      controller.dispose();
    }
    for (var controller in skillControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  proj.add(createRow(projind));
                  projind++;
                });
              },
              child: field('Add Project'),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: proj,
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  intern.add(createRo(interntow));
                  interntow++;
                });
              },
              child: field('Add Internship'),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: intern,
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            Navigator.pushReplacementNamed(context, '/workexp');
          });
        }, child: field('Switch'))
      ],
    );
  }

  Widget createRow(int Rower) {
    int internle=intern.length;
    TextEditingController companyController = TextEditingController();
    TextEditingController projTitleController = TextEditingController();
    TextEditingController functController = TextEditingController();
    TextEditingController indusController = TextEditingController();
    TextEditingController desController = TextEditingController();
    companyControllers.add(companyController);
    projTitleControllers.add(projTitleController);
    functControllers.add(functController);
    indusControllers.add(indusController);
    desControllers.add(desController);
    return Column(
      children: <Widget>[
        TextFormField(
          controller: companyController,
          decoration: textInputDecoration.copyWith(hintText: 'Company Name'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: projTitleController,
          decoration: textInputDecoration.copyWith(hintText: 'Project Name'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: functController,
          decoration: textInputDecoration.copyWith(hintText: 'Function Name'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: indusController,
          decoration: textInputDecoration.copyWith(hintText: 'Industry Name'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: desController,
          decoration: textInputDecoration.copyWith(hintText: 'Description'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              companyControllers.removeAt(Rower);
              projTitleControllers.removeAt(Rower);
              functControllers.removeAt(Rower);
              indusControllers.removeAt(Rower);
              desControllers.removeAt(Rower);
              proj.removeAt(Rower);
              print(Rower);
            });
          },
          child: const Text('Delete'),
        ),
        ElevatedButton(
          onPressed: () {
            // Get the values from the text fields
            String company = companyController.text;
            String projTitle = projTitleController.text;
            String funct = functController.text;
            String indus = indusController.text;
            String des = desController.text;
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  Widget createRo(int Rowers) {
    TextEditingController designationController = TextEditingController();
    TextEditingController companyNameController = TextEditingController();
    TextEditingController functionController = TextEditingController();
    TextEditingController industryController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController skillController = TextEditingController();

    designationControllers.add(designationController);
    companyNamesControllers.add(companyNameController);
    functionControllers.add(functionController);
    industryControllers.add(industryController);
    descriptionControllers.add(descriptionController);
    skillControllers.add(skillController);

    return Column(
      children: <Widget>[
        TextFormField(
          controller: designationController,
          decoration: textInputDecoration.copyWith(hintText: 'Designation'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: companyNameController,
          decoration: textInputDecoration.copyWith(hintText: 'Company Name'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: functionController,
          decoration: textInputDecoration.copyWith(hintText: 'Function Name'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: industryController,
          decoration: textInputDecoration.copyWith(hintText: 'Industry Name'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: descriptionController,
          decoration: textInputDecoration.copyWith(hintText: 'Description'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        TextFormField(
          controller: skillController,
          decoration: textInputDecoration.copyWith(hintText: 'Skills'),
          validator: (value) => value!.isEmpty ? 'Enter Details Properly' : null,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              designationControllers.removeAt(Rowers);
              companyNamesControllers.removeAt(Rowers);
              functionControllers.removeAt(Rowers);
              industryControllers.removeAt(Rowers);
              descriptionControllers.removeAt(Rowers);
              skillControllers.removeAt(Rowers);
              intern.removeAt(Rowers);
            });
          },
          child: const Text('Delete'),
        ),
        ElevatedButton(
          onPressed: () {
            // Get the values from the text fields
            String designation = designationController.text;
            String companyName = companyNameController.text;
            String function = functionController.text;
            String industry = industryController.text;
            String description = descriptionController.text;
            String skills = skillController.text;
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

