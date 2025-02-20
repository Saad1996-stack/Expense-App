import 'package:flutter/material.dart';
import '../on_boarding/login.dart';
import '../on_boarding/register.dart';
import 'expense_list.dart';
import 'expense_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  Register(),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(),
    );
  }
}
