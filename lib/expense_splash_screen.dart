import 'dart:async';

import 'package:flutter/material.dart';

class ExpenseSplashScreen extends StatefulWidget
{
  @override
  State<ExpenseSplashScreen> createState() => _ExpenseSplashScreenState();
}

class _ExpenseSplashScreenState extends State<ExpenseSplashScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/exp_splash.png"),
            fit: BoxFit.fitWidth,
          ),
        ),

      ),
      floatingActionButton:
      SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: ()
          {

          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          backgroundColor: Color(0xFFE78DBE),
          child: Icon(Icons.arrow_right_alt,size: 40,color: Colors.white,),
        ),
      ),

    );
  }
}