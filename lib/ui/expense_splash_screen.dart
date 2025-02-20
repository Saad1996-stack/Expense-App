import 'package:flutter/material.dart';

import 'expense_list.dart';

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
      floatingActionButton:
      SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpenseList()));
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