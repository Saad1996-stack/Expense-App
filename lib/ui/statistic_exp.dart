import 'dart:math';

import 'package:d_chart/d_chart.dart';
import 'package:expense_tracker_app/data_local/models/expense_filter_model.dart';
import 'package:expense_tracker_app/ui/bloc/expense_bloc.dart';
import 'package:expense_tracker_app/ui/bloc/expense_event.dart';
import 'package:expense_tracker_app/ui/bloc/expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expense_list.dart';

class ExpenseStatistics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StatisticExp();
}

class StatisticExp extends State<ExpenseStatistics>
{
  String selectedFilter = "Category wise";

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchFilteredEvent(type: 3));
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>>myData = [
      {
        "title" : "Shop",
        "subtitle"  : "-\$1190",
        "image" : "assets/images/ic_shopping-cart.png",
        "bgColor" : Color(0xFFE78DBE),
      },
      {
        "title" : "Transport",
        "subtitle"  : "-\$867",
        "image" : "assets/images/ic_mobile-phone.png",
        "bgColor" : Color(0xFFE78DBE),
      },
      {
        "title" : "Shop",
        "subtitle"  : "-\$1190",
        "image" : "assets/images/ic_shopping-cart.png",
        "bgColor" : Color(0xFFE78DBE),
      },
      {
        "title" : "Transport",
        "subtitle"  : "-\$867",
        "image" : "assets/images/ic_mobile-phone.png",
        "bgColor" : Color(0xFFE78DBE),
      },
      {
        "title" : "Shop",
        "subtitle"  : "-\$1190",
        "image" : "assets/images/ic_shopping-cart.png",
        "bgColor" : Color(0xFFE78DBE),
      },
      {
        "title" : "Transport",
        "subtitle"  : "-\$867",
        "image" : "assets/images/ic_mobile-phone.png",
        "bgColor" : Color(0xFFE78DBE),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Statistic",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),

            DropdownButton<String>(
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
                  else if(newValue == "Year wise")
                    {
                      selectedType = 2;
                    }
                  else
                    {
                      selectedType = 3;
                    }
                context.read<ExpenseBloc>().add(FetchFilteredEvent(type: selectedType));
                  selectedFilter = newValue!;
                  setState(() {

                  });
                },
              items: <String>["Date wise", "Month wise", "Year wise", "Category wise"]
                  .map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                        child: Text(value));
              }).toList(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            ///Total Expense
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6674D3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total expense",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF7F8CE6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(radius: 2, backgroundColor: Colors.white,),
                              CircleAvatar(radius: 2, backgroundColor: Colors.white,),
                              CircleAvatar(radius: 2, backgroundColor: Colors.white,)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    RichText(
                        text: TextSpan(
                      text: "\$3,734",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      children:[
                        TextSpan(text: "/ \$4000 per month",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 17)),
                      ]
                    )),
                   SizedBox(height: 10,),

                   Card(
                     child: Stack(
                       children: [
                         Container(
                           width: 370,
                           height: 6,
                           decoration: BoxDecoration(
                             color: Color(0xFF7F8CE6),
                             borderRadius: BorderRadius.circular(50)
                           ),
                         ),
                         Container(
                           width: 310,
                           height: 6,
                           decoration: BoxDecoration(
                             color: Color(0xFFE3C397),
                             borderRadius: BorderRadius.circular(50),
                           ),
                         ),
                       ],
                     ),
                   )
                  ],
                ),
              ),
            ),

            ///Expense Breakdown chart

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Expense Breakdown",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    DropdownButton<String>(
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
                        else if(newValue == "Year wise")
                          {
                            selectedType = 2;
                          }
                        else
                          {
                            selectedType = 3;
                          }
                        context.read<ExpenseBloc>().add(FetchFilteredEvent(type: selectedType));
                        selectedFilter = newValue!;
                        setState(() {

                        });
                        },
                      items: <String>["Date wise", "Month wise", "Year wise", "Category wise"]
                        .map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>
                            (
                            value: value,
                              child: Text(value)
                          );
                      }).toList(),
                    ),

                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: "Limit \$900",style: TextStyle(fontSize: 15,color: Colors.black),
                    children: [
                      TextSpan(
                        text: "/ week",style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ExpenseBloc,ExpenseState>(
                  builder: (context,state)
                  {
                    if(state is ExpenseFilteredLoadedState)
                    {
                      List<OrdinalGroup> mGroupList = [];
                      List<OrdinalData> mList = [];

                      for(ExpenseFilterModel eachFilterModel in state.mFilteredExpense)
                      {
                        mList.add(OrdinalData(domain: eachFilterModel.type, measure: eachFilterModel.balance*-1));
                      }
                      OrdinalGroup singleData = OrdinalGroup(id: "1", data: mList);
                      mGroupList.add(singleData);
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AspectRatio(
                          aspectRatio: 16/9,
                          child: DChartBarO(
                            configRenderBar: ConfigRenderBar(
                              barGroupInnerPaddingPx: 0,
                              radius: 10,
                            ),
                            measureAxis: MeasureAxis(
                              showLine: true,
                            ),
                            animate: true,
                            vertical: true,
                            domainAxis: DomainAxis(
                              showLine: false,
                              tickLength: 0,
                              gapAxisToLabel: 12,
                              labelStyle: LabelStyle(
                                color: Colors.black,
                                fontSize: 12,
                              )
                            ),
                              groupList: mGroupList
                          ),
                        ),
                      );
                    }
                    return Container();
                  },),
              ],
            ),

            ///Spending details

            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Spending Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Text("Your expenses are divided into 6 categories",style: TextStyle(fontSize: 16,),),
                ],
              ),
            ),

            ///Categories wise

            Expanded(
              flex: 4,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2/1,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11,
                  ),
                  itemCount: myData.length,
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: ListTile(
                        leading: Card(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade50,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(myData[index]["image"]),
                          ),
                        ),
                        title: Text(myData[index]["title"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                        subtitle: Text(myData[index]["subtitle"],style: TextStyle(fontSize: 16,color: myData[index]["bgColor"]),),
                      ),
                    );
                  }),
            ),

          /*  Column(
              children: [
                Divider(
                  color: Colors.black12,
                  thickness: 2,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpenseList()));
                    },
                        icon: Icon(Icons.home,size: 35,color: Color(0xFFBDBBC7))),
                    IconButton(onPressed: ()
                    {

                    },
                        icon: Icon(Icons.bar_chart,size: 35,color: Color(0xFFE78DBE))),
                    IconButton(onPressed: ()
                    {

                    },
                        icon: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE78DBE),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.add,size: 35,color: Colors.white,))),
                    IconButton(onPressed: ()
                    {

                    },
                        icon: Icon(Icons.notifications,size: 35,color: Color(0xFFBDBBC7),)),
                    IconButton(onPressed: ()
                    {

                    },
                        icon: Icon(Icons.person,size: 35,color: Color(0xFFBDBBC7))),
                  ],
                ),
              ],
            ),*/



          ],
        ),
      ),
    );
  }
}
