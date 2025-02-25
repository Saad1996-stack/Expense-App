import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user_onboarding/login.dart';
import 'expense_list.dart';

class ExpenseSplashScreen extends StatefulWidget
{
  @override
  State<ExpenseSplashScreen> createState() => _ExpenseSplashScreenState();
}

class _ExpenseSplashScreenState extends State<ExpenseSplashScreen>
{
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3), ()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int uid = prefs.getInt("user_id") ?? 0;

      ///using if-else
      /*if(uid > 0)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ExpenseList()));
      }
      else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
      }*/

      Widget navigateTo = Login();

      if(uid > 0)
      {
        navigateTo = ExpenseList();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> navigateTo));
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_logo.png",width: 30,height: 30,),
            SizedBox(width: 2,),
            Text(
              "Monety",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_exp.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            
            ),
          ),
        ],
      ),
    );
  }
}