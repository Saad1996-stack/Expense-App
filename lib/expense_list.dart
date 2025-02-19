import 'package:flutter/material.dart';

  class ExpenseList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExpenseLists();
}

class ExpenseLists extends State<ExpenseList>
{
  @override
  Widget build(BuildContext context)
  {
    List<Map<String,dynamic>> mData = [
      {
        "title" : "Shop",
        "subtitle"  : "Buy new clothes",
        "price"   : "-\$90",
        "image" : "assets/images/ic_boy.png",
        "bgColor" : 0xFFE7E9F8,
      },
      {
        "title" : "Electronic",
        "subtitle"  : "Buy new iphone 14",
        "price"   : "-\$1290",
        "image" : "assets/images/ic_boy.png",
        "bgColor" : 0xFFFEF4EA,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Monety",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/ic_boy.png"),
                ),
                title: Text("Morning",style: TextStyle(fontSize: 18,color: Colors.black45),),
                subtitle: Text("Blaszczykowski",style: TextStyle(fontSize: 18),),
                trailing: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     Center(child: Text("This month",style: TextStyle(fontSize: 17),)),
                      IconButton(onPressed: ()
                      {

                      },
                          icon: Icon(Icons.keyboard_arrow_down)),
                    ],
                  )
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6674D3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 100,
                      width: 395,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expense total",style: TextStyle(color: Colors.white,fontSize: 20),),
                              Text("\$3,734", style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600),),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0665F),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(child: Text("+\$240",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("than last month",style: TextStyle(fontSize: 15,color: Colors.white),),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/bg_exp.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),

            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expense List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 10,),
                  Card(
                    child: Container(
                      height: 200,
                      width: 390,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text("Tuesday, 14",style: TextStyle(fontSize: 16),),
                            trailing: Text("-\$1380",style: TextStyle(fontSize: 16),),
                          ),
                          SizedBox(
                            width: 350,
                            child: Divider(
                              thickness: 1,
                              color: Colors.black12,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: mData.length,
                                itemBuilder: (context,index){
                              return ListTile(
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(mData[index]["bgColor"]),
                                    //  color: Color(0xFFFCE5E6),
                                      borderRadius: BorderRadius.circular(5),
                                      shape: BoxShape.rectangle,
                                  ),
                                ),
                                title: Text(mData[index]["title"],style: TextStyle(fontSize: 16),),
                                subtitle: Text(mData[index]["subtitle"],style: TextStyle(fontSize: 15),),
                                trailing: Text(mData[index]["price"],style: TextStyle(fontSize: 16,color: Color(0xFFE78DBE))),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
                flex: 3,
                child: Card(
                  child: Container(
                      height: 170,
                      width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text("Monday,13",style: TextStyle(fontSize: 16),),
                          trailing: Text("-\$60",style: TextStyle(fontSize: 16),),
                        ),
                        SizedBox(
                          width: 350,
                          child: Divider(
                            thickness: 2,
                            color: Colors.black12,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:1,
                              itemBuilder: (context, index){
                            return ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFCE5E6),
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: AssetImage(""),
                                  )
                                ),
                              ),
                              title: Text("Transportation",style: TextStyle(fontSize: 16),),
                              subtitle: Text("Trip to Malang",style: TextStyle(fontSize: 15),),
                              trailing: Text("-\$60",style: TextStyle(fontSize: 16,color: Color(0xFFE78DBE)),),
                            );
                          }),
                        ),
                      ],
                    )
                  ),
                ),
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

                          },
                              icon: Icon(Icons.home,size: 35,color: Color(0xFFE78DBE))),
                          IconButton(onPressed: ()
                          {

                          },
                              icon: Icon(Icons.bar_chart,size: 35,color: Color(0xFFBDBBC7))),
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
