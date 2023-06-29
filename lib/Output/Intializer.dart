import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intern78/Services/Database.dart';
import 'package:provider/provider.dart';

import '../Decorator/Constructors.dart';
import 'FilesPage.dart';
class Snapshots extends StatelessWidget {
  const Snapshots({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<XdTest>?>.value(
        value: DatabaseService().loadinitaldata,
        initialData: null,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(),
        body: const Result(),
      ),
    );
  }
}
