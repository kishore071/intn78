import 'package:flutter/material.dart';
import 'package:intern78/Decorator/constants.dart';
import 'package:intern78/Services/authservice.dart';
class StepField extends StatefulWidget {
  const StepField({super.key});

  @override
  State<StepField> createState() => _StepFieldState();
}

class _StepFieldState extends State<StepField> {
  final AuthService _authService=AuthService();
  String er='';
  bool _signin=false;
  String email='';
  String password='';
  String error='';
  final _signvalidate=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: _signin?field('Registration'):field('Login In'),
        elevation:0.0,
        actions: [
          TextButton.icon(onPressed: (){
            setState(() {
              _signin=!_signin;
            });
          }, icon: const Icon(Icons.person), label: _signin?field('Login In'):field('Register'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if(_signin!=true)...[
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       dynamic result = await _authService.signinAnnon();
            //       if (result == null) {
            //         er = '${Icons.error}, Error Occurred';
            //         print('${Icons.error}');
            //       } else {
            //         er = '${Icons.supervisor_account_sharp}, Successful';
            //         print('Success');
            //         print(result.uid);
            //         Navigator.pushReplacementNamed(context, '/');
            //       }
            //     },
            //     style: ElevatedButton.styleFrom(
            //       foregroundColor: Colors.greenAccent,
            //       backgroundColor: Colors.grey.shade600,
            //       elevation: 0.0, // Text Color (Foreground color)
            //     ),
            //     child: const Text(
            //       'Sign In Annon',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //   ),
            // ),
              Box(context),
              Form(
                key: _signvalidate,
                child: Column(
                    children:<Widget>[
                      TextFormField(
                        decoration: textInputDecoration.copyWith(labelText: 'Email',),
                        validator: (val)=>val!.isNotEmpty?null:'Enter An Email',
                        onChanged: (val){
                          setState(() {
                            email=val;
                          });
                        },
                      ),
                      Box(context),
                      TextFormField(
                        obscureText: true,
                        validator: (val)=>val!.length<6?'Enter A Strong Password':null,
                        decoration: textInputDecoration.copyWith(labelText: 'Password',),
                        onChanged: (val){
                          setState(() {
                            password=val;
                          });
                        },
                      ),
                      Box(context),
                      ElevatedButton(onPressed: ()async{
                        if(_signvalidate.currentState!.validate()){
                          // print(email);
                          // print(password);
                          dynamic result=await _authService.Login(email, password);
                          if(result==null){
                            setState(() {
                              error='Please Supply enough Variables';
                            });
                          }
                          else{
                            print(result.uid);
                            error='Successfully Registered';
                          }
                        }
                      }, child: field('Login')),
                      Box(context),
                      field(error)
                    ]
                ),)
            ],
            if(_signin)...[
              Box(context),
              Form(
                key: _signvalidate,
                child: Column(
                children:<Widget>[
                  TextFormField(
                    decoration: textInputDecoration.copyWith(labelText: 'Email',),
                    validator: (val)=>val!.isNotEmpty?null:'Enter An Email',
                    onChanged: (val){
                      setState(() {
                        email=val;
                      });
                    },
                  ),
                  Box(context),
                  TextFormField(
                    obscureText: true,
                    validator: (val)=>val!.length<6?'Enter A Strong Password':null,
                    decoration: textInputDecoration.copyWith(labelText: 'Password',),
                    onChanged: (val){
                      setState(() {
                        password=val;
                      });
                    },
                  ),
                  Box(context),
                  ElevatedButton(onPressed: ()async{
                    if(_signvalidate.currentState!.validate()){
                      // print(email);
                      // print(password);
                      dynamic result=await _authService.Register(email, password);
                      if(result==null){
                        setState(() {
                          error='Wrong Credentials,Pls Check ANd Enter';
                        });
                      }
                      else{
                        print(result.uid);
                        error='Successfully Registered';
                      }
                    }
                  }, child: field('Register')),
                  Box(context),
                  field(error)
                ]
              ),)
            ]
          ],
        ),
      ),
    );
  }
}
