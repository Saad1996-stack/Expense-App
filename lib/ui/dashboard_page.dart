import 'package:expense_tracker_app/ui/statistic_exp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user_onboarding/profile.dart';
import 'add_expense_page.dart';
import 'expense_list.dart';
import 'navigation_provider.dart';

class DashboardPage extends StatefulWidget
{
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<Map<String,dynamic>> mNavigate = [
    {
      "icon"  :   Icons.home,
      "label" :   "Home",
      "navigateTo"  : ExpenseList(),
    },
    {
      "icon"  : Icons.bar_chart,
      "label" : "Stats",
      "navigateTo"  : ExpenseStatistics(),
    },
    {
      "icon"  : Icons.add,
      "label" : "Add",
      "navigateTo"  : AddExpensePage(),
    },
    {
      "icon"  : Icons.person,
      "label" : "Profile",
      "navigateTo"  : ProfilePage(),
    },
  ];

  @override
  Widget build(BuildContext context)
  {
    return Consumer<NavigationProvider>(
        builder: (ctx, provider,__){
      return Scaffold(
        body: mNavigate[ctx.watch<NavigationProvider>().navIndex]['navigateTo'], ///getter
        bottomNavigationBar: NavigationBar(
            selectedIndex: provider.navIndex, ///getter
            onDestinationSelected: (index){
              ///setter
              provider.navIndex = index;

            },
            destinations: mNavigate.map((e){
              return NavigationDestination(icon: Icon(e["icon"]), label: e["label"]);
            }).toList()),
      );
    });
  }
}
