import 'package:flutter/material.dart';
import 'package:intern78/Decorator/constants.dart';
import 'package:intern78/singlepage/ButtonRowPage.dart';
class ProjectAndIntern extends StatefulWidget {
  const ProjectAndIntern({super.key});

  @override
  State<ProjectAndIntern> createState() => _ProjectAndInternState();
}

class _ProjectAndInternState extends State<ProjectAndIntern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: field('Project And Internship'),
        leading: Image.asset('assets/img/Easwari_Engineering_College_logo.png',fit: BoxFit.contain,)
      ),
      body:const SingleChildScrollView(
          child:ButtonRowPage()),
    );
  }
}
