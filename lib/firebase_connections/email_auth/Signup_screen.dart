
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled9/scr/common_widgets/Rounded_btn.dart';

import '../../scr/common_widgets/UI_helper.dart';
import 'Login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final CpasswordController = TextEditingController();
  bool isLoading = false;
  String errorMessage = "";

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = CpasswordController.text.trim();

    if(email == "" || password == "" || cPassword == ""){
      log("Please fill all the details!");
    }else if(password != cPassword){
      log('Passwords do not match ');

    }else {
      //Create new account
      try {
        setState(() {
          isLoading = true;
          errorMessage =" ";
        });
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          Navigator.pop(context);
        }
        log("User is succfully created !!");
      } on FirebaseAuthException catch(ex){
        if(ex.code == " Password should be at least 6 characters"){

        }
        log(ex.code.toString());
        print(ex.code.toString());
        setState(() {
          errorMessage = ex.message ?? 'An error occurred'; // Set error message from ex.message

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
                child: Text('Create Your Account !',style: TextStyle(color: Colors.white,fontSize: 25),),
              ),
            ),
            Expanded(
              child: Container(
              
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Signin to continue',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w900,fontSize: 20),),
                        SizedBox(height: 30,),
                        UiHelper.CoustomTextField(emailController, 'Email', Icons.email, TextInputType.emailAddress, false),
                        SizedBox(height: 8,),
                        UiHelper.CoustomTextField(passwordController, 'Password', Icons.lock, TextInputType.visiblePassword, false),
                        SizedBox(height: 8,),
                        UiHelper.CoustomTextField(CpasswordController, 'Conform Password', Icons.lock_open, TextInputType.visiblePassword, false),
                              SizedBox(height: 20,),
                         UiHelper.CustomBtn(() {
                          createAccount();
              
                        },isLoading? 'Creating account...' : 'Signup'),
              
                        SizedBox(height: 20,),
              
              
              
                        Text('Continue with',style: TextStyle(fontWeight: FontWeight.w900),),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
              
                            UiHelper.CustomLogoBtn(Image.asset('assets/images/google.png')),
                            SizedBox(width: 10,),
                            UiHelper.CustomLogoBtn(Image.asset('assets/images/facebook.png')),
                            SizedBox(width: 10,),
                            UiHelper.CustomLogoBtn(Image.asset('assets/images/apple.png')),
              
              
                    ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
              
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              },
                              child: Text('Login',style: TextStyle(color: Colors.deepOrange),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                        
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
