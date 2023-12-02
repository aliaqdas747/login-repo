// custom_textfield.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
//  final _formField = GlobalKey<FormState>();
  final String labelText;
  final IconData iconData;
  final TextEditingController controller;
  final bool isPassword;


  CustomTextField({required this.labelText, required this.iconData, required this.controller, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(

            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.deepOrange
            ),
            prefixIcon: Icon(iconData),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),


            )
        ),

      ),
    );
  }
}
class UiHelper{
  static CoustomTextField(          //Static function is used when we want to call this function anywhere in the app
      TextEditingController controller ,//TextEditing controller is parameter &controller is instance .
      String text,
      //String is parameter and text is its instance
      IconData iconData,
      TextInputType keyboardType,
      bool toHide ){
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.deepOrange
          ),
          suffixIcon: Icon(iconData,color: Colors.deepOrange,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.deepOrange, // Set the desired border color here
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

  }

static CustomLogoBtn(
    //Add actions .......
    Image logo,
    ){
    return Container(
      width: 50,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: logo,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.deepOrange,
        ),
      ),
    );
}


  //Button
  static CustomBtn(
      VoidCallback voidCallback ,String text){
    return  InkWell(

      onTap: voidCallback,
      child: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          color: Colors.deepOrange
        ),
        child: Center(child: Text(text,style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),),
      ),
    );
  }
  static CostumAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){}, child: Text('OK'))
        ],

      );
    });
  }
}
