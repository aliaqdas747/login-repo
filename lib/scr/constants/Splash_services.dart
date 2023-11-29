import 'dart:async';
import 'package:flutter/material.dart';

import '../../firebase_connections/email_auth/Login_screen.dart';

class SplashServices{
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 2),()=>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage())));


  }
}