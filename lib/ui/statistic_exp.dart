import 'package:flutter/material.dart';

import 'expense_list.dart';

class ExpenseStats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StatisticExp();
}

class StatisticExp extends State<ExpenseStats>
{
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
            Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                        child: Text(
                      "This month",
                      style: TextStyle(fontSize: 17),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down)),
                  ],
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
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
            ),
            SizedBox(height: 10,),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Expense Breakdown",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Container(
                          width: 75,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                    "Week",
                                    style: TextStyle(fontSize: 17),
                                  )),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Limit \$900",style: TextStyle(fontSize: 15,color: Colors.black),
                          children: [
                            TextSpan(
                              text: "/ week",style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Spending Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Your expenses are divided into 6 categories",style: TextStyle(fontSize: 16,),),
                  ],
                ),
              )
            ),

            Expanded(
              flex: 6,
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
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFE7E9F8),
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(myData[index]["image"]),
                              ),
                            ),
                          ),
                        ),
                        title: Text(myData[index]["title"],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                        subtitle: Text(myData[index]["subtitle"],style: TextStyle(fontSize: 16,color: myData[index]["bgColor"]),),
                      ),
                    );
                  }),
            ),

            Expanded(
              flex: 2,
              child: Column(
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
              ),

            ),
          ],
        ),
      ),
    );
  }
}
