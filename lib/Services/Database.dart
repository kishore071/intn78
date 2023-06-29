import 'package:cloud_firestore/cloud_firestore.dart';

import '../Decorator/Constructors.dart';
class DatabaseService{
  final String? userid;
  DatabaseService({this.userid});
  final CollectionReference entryCollection=FirebaseFirestore.instance.collection('initial Data');
  Future InitialData(String name) async {
     final datas={
       'name':name,
       'birthday':DateTime(2001,7,21),
     };
    await entryCollection.doc(userid).set(datas);
  }
  //test field listing
  List<XdTest> _listsnap(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return XdTest(
        name: data['name'] ?? '',
        date: (data['birthday'] as Timestamp ?)?.toDate(),
      );
    }).toList();
  }



  //get the stream data for testing
  Stream<List<XdTest>>get loadinitaldata{
    return entryCollection.snapshots()
    .map(_listsnap);
  }
}