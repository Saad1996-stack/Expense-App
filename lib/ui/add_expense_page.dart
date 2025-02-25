import 'package:expense_tracker_app/data_local/database/dbhelper.dart';
import 'package:expense_tracker_app/data_local/models/expense_models.dart';
import 'package:expense_tracker_app/domain/app_constants.dart';
import 'package:expense_tracker_app/domain/ui_helper.dart';
import 'package:expense_tracker_app/ui/bloc/expense_bloc.dart';
import 'package:expense_tracker_app/ui/bloc/expense_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customwidgets/textfield.dart';

class AddExpensePage extends StatefulWidget
{
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {

  DBHelper dbHelper = DBHelper.getInstance();

  TextEditingController titleCont = TextEditingController();

  TextEditingController descCont  = TextEditingController();

  TextEditingController amountCont = TextEditingController();

  TextEditingController typeCont   = TextEditingController();

  List<String>mType = ["Debit", "Credit", "Loan", "Borrow", "Lend"];

  ///initial drop down selection
  String selectedType = "Debit";

  int selectedCatIndex = -1;

  DateTime? selectedDateTime;

  DateFormat df = DateFormat.MMMEd();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomTextfield(
              controller: titleCont,
                keyboardType: TextInputType.text,
                label: "Expense Title",
                hintText: "Enter Expense Title",
              ),
              mSpacer(),
        
              CustomTextfield(
                controller: descCont,
                keyboardType: TextInputType.text,
                label: "Expense Desc",
                hintText: "Enter Expense Desc",
              ),
              mSpacer(),
        
              CustomTextfield(
                controller: amountCont,
                keyboardType: TextInputType.number,
                label: "Expense Amount",
                hintText: "Enter Expense Amount",
              ),
              mSpacer(),
        
             ///drop down method
             /*DropdownButton(
               value: selectedType,
                 items: mType.map((value){
                   return DropdownMenuItem(
                       child: Text(value),
                   value: value,
                   );
                 }).toList(),
                 onChanged: (value){
                   selectedType = value!;
                   setState(() {
        
                   });
                 }),*/
        
            ///dropdown another method
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: DropdownMenu(
                  width: 385,
                  label: Text("Expense Type"),
                  inputDecorationTheme: InputDecorationTheme(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Color(0xFF5AE3A7),
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Color(0xFF5AE3A7),
                      )
                    ),
                  ),
                  initialSelection: selectedType,
                    onSelected: (value){
                      selectedType = value!;
                    },
                    dropdownMenuEntries: mType.map((value){
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList()),
              ),
              mSpacer(),
        
              InkWell(
                  onTap: ()
                  {
                    showModalBottomSheet(context: context, builder: (context)=> Container(
                      padding: EdgeInsets.only(top: 11),
                      child: GridView.builder(
                        itemCount: AppConstants.mCat.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: ()
                              {
                                selectedCatIndex = index;
                                Navigator.pop(context);
                                setState(() {
        
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(AppConstants.mCat[index].category_image,width: 50,height: 50,),
                                    mSpacer(),
                                    Text(AppConstants.mCat[index].category_title),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ));
                  },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    height: 53,
                    width: 384,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xFF5AE3A7),
                      ),
                    ),
                    child: selectedCatIndex >=0 ? Center(child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppConstants.mCat[selectedCatIndex].category_image,width: 50,height: 50,),
                        Text("  -  ${AppConstants.mCat[selectedCatIndex].category_title}"),
                      ],
                    ),) : Center(child: Text("Choose Category",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                  ),
                ),
              ),
        
              mSpacer(),
        
          ///import the intl package for date time formats
          InkWell(
            onTap: ()
            async{
              selectedDateTime = await showDatePicker(context: context,
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now(),);
              setState(() {
        
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Container(
                height: 53,
                width: 384,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFF5AE3A7),
                  ),
                ),
                child: Center(child: Text(df.format(selectedDateTime ?? DateTime.now()),style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
          ),
        
              mSpacer(),
        
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: SizedBox(
                  height: 52,
                  width: 384,
                  child: ElevatedButton(onPressed: ()
                  async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    int uid = prefs.getInt("user_id") ?? 0;

                    ///implement same with Bloc
                    context.read<ExpenseBloc>().add(AddExpenseEvent(newAddExpModelEvent: ExpenseModels(
                        userId: uid,
                        eDate: (selectedDateTime ?? DateTime.now()).millisecondsSinceEpoch.toString(),
                        eCategoryId: AppConstants.mCat[selectedCatIndex].category_id,
                        eTitle: titleCont.text,
                        eDesc: descCont.text,
                        eAmount: double.parse(amountCont.text),
                        eBalance: 0,
                        eType: selectedType)));


                   /* ///implement with Database
                    dbHelper.addExpense(expense: ExpenseModels(
                        userId: uid,
                        eDate: (selectedDateTime ?? DateTime.now()).millisecondsSinceEpoch.toString(),
                        eCategoryId: AppConstants.mCat[selectedCatIndex].category_id,
                        eTitle: titleCont.text,
                        eDesc: descCont.text,
                        eAmount: double.parse(amountCont.text),
                        eBalance: 0,
                        eType: selectedType),);*/
                    Navigator.pop(context);
                  },
                      child: Text("Add Expense",),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFF5AE3A7),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
