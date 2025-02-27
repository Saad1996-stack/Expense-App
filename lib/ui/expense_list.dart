import 'dart:math';

import 'package:expense_tracker_app/domain/app_constants.dart';
import 'package:expense_tracker_app/ui/bloc/expense_bloc.dart';
import 'package:expense_tracker_app/ui/bloc/expense_event.dart';
import 'package:expense_tracker_app/ui/bloc/expense_state.dart';
import 'package:expense_tracker_app/ui/statistic_exp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data_local/models/expense_filter_model.dart';
import '../data_local/models/expense_models.dart';
import 'add_expense_page.dart';

class ExpenseList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExpenseLists();
}

class ExpenseLists extends State<ExpenseList> {

  String selectedFilter = "Date wise";

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchFilteredEvent(type: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/ic_logo.png",width: 30,height: 30,),
            SizedBox(width: 2,),
            Expanded(
              child: Text(
                "Monety",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/ic_boy.png"),
              ),
              title: Text(
                "Morning",
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
              subtitle: Text(
                "Blaszczykowski",
                style: TextStyle(fontSize: 14),
              ),
              trailing: DropdownButton<String>(
                value: selectedFilter,
                onChanged: (String? newValue){
                  int selectedType = 0;
                  if(newValue == "Date wise")
                  {
                    selectedType = 0;
                  }
                  else if(newValue == "Month wise")
                  {
                    selectedType = 1;
                  }
                  else
                  {
                    selectedType = 2;
                  }
                  context.read<ExpenseBloc>().add(FetchFilteredEvent(type: selectedType));
                  selectedFilter = newValue!;
                  setState(() {

                  });
                },
                items: <String>["Date wise", "Month wise", "Year wise"]
                    .map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                  value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 5,),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6674D3),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 110,
                      width: 395,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expense total",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                "\$3,734",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0665F),
                                      borderRadius:
                                          BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "+\$240",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "than last month",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: -10,
                  child: Container(
                    height: 120,
                    width: 210,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg_expense.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

            Align(
              alignment: Alignment.topLeft,
                child: Text("Expense List", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),)),
            SizedBox(height: 10,),

            Expanded(
              child: BlocBuilder<ExpenseBloc, ExpenseState>(
                builder: (_,state){
                    if(state is ExpenseLoadingState)
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    if(state is ExpenseErrorState)
                      {
                        return Center(child: Text(state.errorMessageState),);
                      }
                    if(state is ExpenseFilteredLoadedState)
                      {

                        return state.mFilteredExpense.isNotEmpty ?
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: state.mFilteredExpense.length,
                                itemBuilder: (context, index){
                                  //final expense = state.loadedExpenseModels[index];
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 6,
                                          offset: Offset(0,4),
                                        )
                                      ]
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(state.mFilteredExpense[index].type,
                                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                            ),

                                            Spacer(),

                                            Text("\$${(state.mFilteredExpense[index].balance)}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: (state.mFilteredExpense[index].balance ?? 0) >= 0 ? Colors.green : Colors.red),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Divider(),

                                        ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: state.mFilteredExpense[index].allExpense.length,
                                            itemBuilder: (_,childIndex){
                                              return  ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                  leading: Container(
                                                    padding: EdgeInsets.all(7),
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(AppConstants.mCat.where((eachCat){
                                                      return eachCat.category_id == state.mFilteredExpense[index].allExpense[childIndex].eCategoryId;
                                                    }).toList()[0].category_image),
                                                    decoration: BoxDecoration(
                                                      color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade50,
                                                      borderRadius: BorderRadius.circular(11),
                                                    ),
                                                  ),
                                                  title: Text(state.mFilteredExpense[index].allExpense[childIndex].eTitle),
                                                  subtitle:Text(state.mFilteredExpense[index].allExpense[childIndex].eDesc),
                                                  trailing:Text("\$${state.mFilteredExpense[index].allExpense[childIndex].eAmount}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: state.mFilteredExpense[index].allExpense[childIndex].eAmount! < 0 ? Colors.red : Colors.green),),

                                              );
                                            }),
                                      ],
                                    ),
                                  );
                                },

                                )
                            : Center(child: Text("No Expense Yet"),);
                      }
                    return Container();
                },

                ),
              ),


            Column(
              children: [
                Divider(
                  color: Colors.black12,
                  thickness: 2,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: ()
                        {
                        },
                        icon: Icon(Icons.home,
                            size: 35, color: Color(0xFFE78DBE))),
                    IconButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpenseStatistics()));
                        },
                        icon: Icon(Icons.bar_chart,
                            size: 35, color: Color(0xFFBDBBC7))),

                    IconButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddExpensePage()));
                        },
                        icon: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE78DBE),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.white,
                            ))),

                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          size: 35,
                          color: Color(0xFFBDBBC7),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person,
                            size: 35, color: Color(0xFFBDBBC7))),
                  ],
                ),
              ],
            ),
    ]
        ),
      ),
    );
  }

}
