 


import 'package:flutter/material.dart';

import '../scr/constants/Splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  SplashServices splashScreen = SplashServices();
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.pink,
                ]
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/wc.png',height: 200,width: 200,),
              // assets('assets/images/img.png'),
              Text('F I R E B A S E',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
            ],
          ),
        ),
      ),
    );
  }
}
