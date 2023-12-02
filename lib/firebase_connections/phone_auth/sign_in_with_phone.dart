import 'package:flutter/material.dart';

import '../../scr/common_widgets/UI_helper.dart';

class SigninWithPhone extends StatefulWidget {
  const SigninWithPhone({super.key});

  @override
  State<SigninWithPhone> createState() => _SigninWithPhoneState();
}

class _SigninWithPhoneState extends State<SigninWithPhone> {
  TextEditingController phoneController = TextEditingController();

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
                child: Text('Please add detail\n to continue',style: TextStyle(color: Colors.white,fontSize: 20),),
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
                        Text('Sigin with phone Number ',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w900),),
                        SizedBox(height: 30,),
                      UiHelper.CoustomTextField(phoneController, 'Phone Number ', Icons.phone, TextInputType.phone, false),
                        SizedBox(height: 8,),
                     //   UiHelper.CoustomTextField(passwordController, 'Password', Icons.lock, false),


                        SizedBox(height: 40,),
                        UiHelper.CustomBtn(() { }, 'Sign in'),


                        SizedBox(height: 8,),



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
                           //     Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
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
