import 'package:expense_tracker_app/data_local/database/dbhelper.dart';
import 'package:expense_tracker_app/user_onboarding/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/expense_list.dart';

class Login extends StatelessWidget
{
  DBHelper dbHelper = DBHelper.getInstance();

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Smart Spending Starts Here\n",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.black),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      //resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/bg_login.png",),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                    Text("Login to Proceed",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900)),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: user,
                      decoration: InputDecoration(
                        label: Text("username"),
                        hintText: "xyz123@gmail.com",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Color(0xFF5AE3A7),
                            ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Color(0xFF5AE3A7)
                            ),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    borderOnForeground: false,
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      keyboardType: TextInputType.text,
                      controller: pass,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        label: Text("password"),
                          hintText: "Enter password here ...",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Color(0xFF5AE3A7)
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Color(0xFF5AE3A7),
                            ),
                          ),
                      ),
                    ),
                  ),
        
                  Padding(
                    padding: EdgeInsets.only(left: 240),
                    child: Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.redAccent),),
                  ),
                  SizedBox(height: 10,),

                  Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF5AE3A7)),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: ElevatedButton(onPressed: ()
                    async{
                      bool check = await dbHelper.authenticateUser(email: user.text, password: pass.text);
                      if(check)
                        {
                          /*SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool("Login", true);*/
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Successfully Logged-in!!")));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ExpenseList()));
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid credentials please logged-in again!!")));
                        }
                    },
                        child: Text("Login"),
                      style: ElevatedButton.styleFrom(
        
                        fixedSize: Size(380, 50),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
        
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                    },
                    child: RichText(
                        text:
                        TextSpan(
                      text: "Don't have an account! ",style: TextStyle(fontSize: 15,color: Colors.black),
                        children: [
                          TextSpan(text: "Please Register",style: TextStyle(fontSize: 15,color: Colors.red)),
                        ],),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}