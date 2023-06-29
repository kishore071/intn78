import 'package:firebase_auth/firebase_auth.dart';
import 'package:intern78/Services/Database.dart';

import '../Decorator/Constructors.dart';
class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //creating user obj to use through out the
  Usersxd? _fireusers(User user){
    if (user!=null) {
      return Usersxd(uid: user.uid);
    } else {
  return null;
    }
}

//maintaining cookies kinda thing using streams
  Stream<Usersxd?> get users{
    return _auth.authStateChanges()
        .map((User? user) =>_fireusers(user!) );
  }

  //annon signin
  Future signinAnnon()async{
    try{
      UserCredential result=await _auth.signInAnonymously();
      User? user=result.user;
      return _fireusers(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //Register with mail and pass
  Future Register(String email,String pwd) async {
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
      User? user =result.user;
      DatabaseService(userid: user!.uid).entryCollection;
      return _fireusers(user);
    }
    catch(e){
      print(e.toString());
    }
  }

  //signin(login) with mail and pass
  Future Login(String email,String pwd) async {
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      User? user =result.user;
      return _fireusers(user!);
    }
    catch(e){
      print(e.toString());
    }
  }

  //sign out instance
  Future signout()async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}