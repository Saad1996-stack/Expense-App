import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget
{
  final TextInputType keyboardType;
  final String label;
  final String hintText;
  final bool obscureText;
  final String obscuringCharacter;
  final TextEditingController controller;

  CustomTextfield({required this.controller, required this.keyboardType, required this.label, required this.hintText, this.obscureText = false, this.obscuringCharacter = "•" });

  @override
  Widget build(BuildContext context)
  {
    return  Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)),
      borderOnForeground: false,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Color(0xFF5AE3A7))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Color(0xFF5AE3A7),
            ),
          ),
        ),
      ),
    );
  }

}