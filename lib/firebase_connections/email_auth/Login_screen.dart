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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String errorMessage = "";

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "" || password == "") {

      print('Please fill all the fields ');
      setState(() {
        errorMessage ="Email or Password is missing.!";
      });
    } else {
      try {
        setState(() {
          errorMessage =" ";
          isLoading = true; // Set isLoading to true when login starts
        });

        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential != null) {
          // Simulate a delay for 2 seconds
          await Future.delayed(Duration(seconds: 2));

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => home_screen()));
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
        setState(() {
          errorMessage = ex.message ?? 'An error occurred'; // Set error message from ex.message
        });
      } finally {
        setState(() {

          isLoading = false; // Set isLoading to false after login completes
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.orange.shade900,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100,bottom: 40),
              child: Center(
                child: Text('Welcome back!',style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),



            Expanded(
              child: Container(

                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(


                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Signin to continue',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w900),),
                        SizedBox(height: 30,),
                        UiHelper.CoustomTextField(emailController, 'Email', Icons.email, TextInputType.emailAddress, false),

                        SizedBox(height: 8,),
                        UiHelper.CoustomTextField(passwordController, 'Password', Icons.lock, TextInputType.visiblePassword, false),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(right: 25),
                               child: Text('Forget Password',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w600),),
                             ),
                           ],
                         ),

                         SizedBox(height: 40,),
                        UiHelper.CustomBtn(() {
                         login();

                        },isLoading? 'loading...' : 'Login'),



                        SizedBox(height: 8,),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(errorMessage,style: TextStyle(color: Colors.red.shade900),),
                          ],
                        ),

                        SizedBox(height: 100,),
                        Text('Continue with',style: TextStyle(fontWeight: FontWeight.w900),),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            UiHelper.CustomLogoBtn(Image.asset('assets/images/google.png')),
                            SizedBox(width:20,),
                            UiHelper.CustomLogoBtn(Image.asset('assets/images/facebook.png')),
                            SizedBox(width: 20,),
                            UiHelper.CustomLogoBtn(Image.asset('assets/images/apple.png')),


                          ],
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dos't have an Account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                              },
                              child: Text('Sign up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),


                ),
              ),
            )
          ],

        ),
      )
    );
  }
}
