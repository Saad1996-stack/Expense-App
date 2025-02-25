import 'package:expense_tracker_app/data_local/database/dbhelper.dart';
import 'package:expense_tracker_app/data_local/models/user_model.dart';
import 'package:flutter/material.dart';

import '../customwidgets/textfield.dart';
import 'login.dart';

class Register extends StatelessWidget {

  TextEditingController name = TextEditingController();
  //TextEditingController lName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  DBHelper dbHelper = DBHelper.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: RichText(
          text: TextSpan(
            text: "Join Us",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 25, color: Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black12,
        /* decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_register.png"),
            fit: BoxFit.cover,
          )
        ),*/
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Registration",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Please register your account to sign in",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45)),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      controller: name,
                      keyboardType: TextInputType.text,
                      label: "Name",
                      hintText: "Enter your name",
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    CustomTextfield(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      label: "Phone",
                      hintText: "Enter your Phone no",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextfield(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      hintText: "xyz123@gmail.com",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextfield(
                      controller: confirmEmail,
                      keyboardType: TextInputType.emailAddress,
                      label: "Confirm email address",
                      hintText: "xyz123@gmail.com",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextfield(
                      obscureText: true,
                      controller: password,
                      keyboardType: TextInputType.text,
                      label: "Password",
                      hintText: "Enter your password",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextfield(
                      obscureText: true,
                      controller: confirmPassword,
                      keyboardType: TextInputType.text,
                      label: "Confirm Password",
                      hintText: "Enter confirm password",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF5AE3A7)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          ///register
                          if (!await dbHelper.isUserAlreadyRegistered(
                              email: email.text, phoneNo: phone.text))
                          {
                            UserModel newUser = UserModel(
                                userName: name.text,
                                uEmail: email.text,
                                uPassword: password.text,
                                uPhone: phone.text,
                                uCreatedAt: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString());

                             bool check = await dbHelper.registerUser(user: newUser);

                             if(check)
                               {
                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User successfully registered, login now!!")));
                                 Navigator.pop(context);

                               }
                             else
                               {
                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong, please try again!!")));
                               }
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "User already registered, login now!!")));
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(380, 50),
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF5AE3A7),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          /*Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));*/
                        },
                        child: RichText(
                            text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          children: [
                            TextSpan(
                                text: "Sign in",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
