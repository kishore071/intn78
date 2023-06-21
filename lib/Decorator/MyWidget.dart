import 'package:flutter/material.dart';
import '../Componenets/ExpandableTextField.dart';
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable Text Fields'),
      ),
      body: Center(
        child: ExpandableTextField(),
      ),
    );
  }
}
