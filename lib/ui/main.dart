import 'package:expense_tracker_app/data_local/database/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import '../user_onboarding/login.dart';
import '../user_onboarding/register.dart';
import 'bloc/expense_bloc.dart';
import 'expense_list.dart';
import 'expense_splash_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(dbHelper: DBHelper.getInstance()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ExpenseSplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
