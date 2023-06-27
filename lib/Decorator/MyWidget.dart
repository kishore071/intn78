import 'package:flutter/material.dart';
import 'package:intern78/Decorator/EducDeta.dart';
import '../Componenets/ExpandableTextField.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Text Fields'),
      ),
      body: const AddressField(),
    );
  }
}
