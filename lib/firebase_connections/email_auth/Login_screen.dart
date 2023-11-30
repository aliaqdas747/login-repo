
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled9/Screens/home_screen.dart';

import '../../scr/common_widgets/UI_helper.dart';
import 'Signup_screen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();

void login()async{
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  if(email == "" || password == "") {
    print('Please fill all the fields ');
  }else{
    try{
      UserCredential userCredential  =await   FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
if(userCredential != null){
Navigator.popUntil(context, (route)=> route.isFirst);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> home_screen()));
}
    } on FirebaseAuthException catch(ex) {
    print(ex.code.toString());
    }

  }
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Login',style: TextStyle(color: Colors.pink),),

          ],
        ),

        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/login.png',height: 200,width: 200,),

///TextFields
                UiHelper.CoustomTextField(emailController, 'Email', Icons.email, false),
                SizedBox(height: 10,),
                UiHelper.CoustomTextField(passwordController, 'Password', Icons.lock, true),





                SizedBox(height: 50,),

                UiHelper.CustomBtn(() {
                  login();
                }, 'L O G I N'),
                SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),

                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                    }, child: Text('Sign up'))
                  ],
                ),



              ],
            ),
          ),
        ),
      ),

    );
  }
}
