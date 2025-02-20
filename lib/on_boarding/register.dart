import 'package:flutter/material.dart';

import '../customwidgets/textfield.dart';

class Register extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_register.png"),
            fit: BoxFit.cover,
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Registration",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
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
                      height: 10,
                    ),
        
                    CustomTextfield(
                      controller: lName,
                      keyboardType: TextInputType.text,
                      label: "Last name",
                      hintText: "Enter your Last name",
                    ),
        
                    SizedBox(
                      height: 10,
                    ),
        
                    CustomTextfield(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      label: "Phone",
                      hintText: "Enter your Phone no",
                    ),
        
                    SizedBox(
                      height: 10,
                    ),
        
                    CustomTextfield(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      hintText: "xyz123@gmail.com",
                    ),
        
                    SizedBox(
                      height: 10,
                    ),
        
                    CustomTextfield(
                      controller: confirmEmail,
                      keyboardType: TextInputType.emailAddress,
                      label: "Confirm email address",
                      hintText: "xyz123@gmail.com",
                    ),
        
                    SizedBox(
                      height: 10,
                    ),
        
                    CustomTextfield(
                      controller: password,
                      keyboardType: TextInputType.text,
                      label: "Password",
                      hintText: "Enter your password",
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF5AE3A7)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(

                        onPressed: ()
                      {

                      },
                          child: Text("Register",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(380, 50),
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF5AE3A7),
                        ),

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
