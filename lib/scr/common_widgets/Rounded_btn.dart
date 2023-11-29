import 'package:flutter/material.dart';

class RoundBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTab;

  const RoundBtn({super.key, required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTab,
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(

                colors: [
                  Colors.orange,
                  Colors.pink.shade500,
                  Colors.orange,]
            )
        ),
        child: Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),),
      ),
    );
  }
}
