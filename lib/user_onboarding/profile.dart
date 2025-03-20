import 'package:expense_tracker_app/domain/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customwidgets/textfield.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget
{
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  TextEditingController profileNameCont = TextEditingController();

  TextEditingController profilePhoneCont  = TextEditingController();

  TextEditingController profileEmailCont  = TextEditingController();

  TextEditingController profilePassCont   = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void>loadUserData()
  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      profileNameCont.text = prefs.getString("userName") ?? "";
      profilePhoneCont.text = prefs.getString("userPhone") ?? "";
      profileEmailCont.text = prefs.getString("userEmail") ?? "";
      profilePassCont.text = prefs.getString("userPassword") ?? "";

    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: ()
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                  },
                  child: Icon(Icons.logout))),
          centerTitle: true,
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text("Personal Dashboard",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),

                mSpacer(),

                CustomTextfield(
                  controller: profileNameCont,
                  keyboardType: TextInputType.text,
                  label: "Name",
                  hintText: 'Enter your name',
                ),

                mSpacer(),

                CustomTextfield(
                  controller: profilePhoneCont,
                  keyboardType: TextInputType.text,
                  label: "Phone",
                  hintText: 'Enter phone',
                ),

                mSpacer(),

                CustomTextfield(
                  controller: profileEmailCont,
                  keyboardType: TextInputType.text,
                  label: "Email",
                  hintText: 'Enter email',
                ),

                mSpacer(),

                CustomTextfield(
                  obscureText: true,
                  obscuringCharacter: "*",
                  controller: profilePassCont,
                  keyboardType: TextInputType.text,
                  label: "Password",
                  hintText: 'Enter password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}