
import 'dart:developer';

import 'package:flutter/material.dart';

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

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up', style: TextStyle(color: Colors.pink)),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/sign_png.png', height: 200, width: 200),
                      UiHelper.CoustomTextField(emailController, 'Email', Icons.email, false),
                      SizedBox(height: 10),
                      UiHelper.CoustomTextField(passwordController, 'Password', Icons.lock, false),
                      SizedBox(height: 10),
                      UiHelper.CoustomTextField(CpasswordController, 'Conform Password', Icons.remove_red_eye, false),
                      SizedBox(height: 50),
                      UiHelper.CustomBtn(() {
                        createAccount();

                      }, 'Signup'),
                      SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
