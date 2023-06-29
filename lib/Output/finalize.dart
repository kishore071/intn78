// import 'package:flutter/material.dart';
// import 'package:intern78/Decorator/Constructors.dart';
// import 'package:intern78/Decorator/constants.dart';
// import 'package:intern78/Services/authservice.dart';
// import 'package:provider/provider.dart';
//
// import '../Services/Database.dart';
// class Finalize extends StatefulWidget {
//    Finalize({super.key});
//
//   @override
//   State<Finalize> createState() => _FinalizeState();
// }
//
// class _FinalizeState extends State<Finalize> {
//   @override
//   String users='';
//   AuthService _authService=AuthService();
//   DateTime dob=DateTime(2001,7,21);
//
//   Widget build(BuildContext context) {
//     final user=Provider.of<Usersxd?>(context);
//     print(user!.uid);
//     bool _dataAvalaible=false;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//       ),
//       backgroundColor: Colors.grey,
//       body: Column(
//         children: [
//           FutureBuilder<XdTest?>(
//             future: DatabaseService(userid: user.uid).getUserData(),
//             builder: (context, AsyncSnapshot<XdTest?> snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 Map<String,dynamic> data=snapshot.data!data;
//                 // While data is being fetched
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 // If an error occurred
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 // If data retrieval is successful
//                 if (snapshot.hasData) {
//                   XdTest? userData = snapshot.data;
//                   if (userData != null) {
//                     users=userData.name!;
//                     _dataAvalaible=!_dataAvalaible;
//                     return Column(
//                       children: [
//                         Text('User Name: ${userData.name}'),
//                         Text('Date: ${userData.date}'),
//                       ],
//                     );
//                   } else {
//                     return Text('User data not found');
//                   }
//                 } else {
//                   return Text('No data');
//                 }
//               }
//             },
//           ),
//           field(users),
//         ],
//       ),
//     );
// }
// }
