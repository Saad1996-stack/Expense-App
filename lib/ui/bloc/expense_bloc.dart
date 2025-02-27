import 'package:expense_tracker_app/data_local/database/dbhelper.dart';
import 'package:expense_tracker_app/data_local/models/expense_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data_local/models/expense_filter_model.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState>
{
  DBHelper dbHelper;
  DateFormat df = DateFormat.yMMM();

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()){

    on<AddExpenseEvent>((event, emit)async{

      emit(ExpenseLoadingState());
      bool check = await dbHelper.addExpense(expense: event.newAddExpModelEvent);
      if(check)
        {
          List<ExpenseModels> allExpenses = await dbHelper.fetchAllExpense();
         // emit(ExpenseLoadedState(loadedExpenseModels: allExpenses));
          emit(ExpenseFilteredLoadedState(mFilteredExpense: filterExp(allExpenses)));
        }
      else
        {
          emit(ExpenseErrorState(errorMessageState: "Expense Not Added"));
        }
    });

    on<FetchInitialEvent>((event,emit)async{
      emit(ExpenseLoadingState());

      List<ExpenseModels> allExpenses = await dbHelper.fetchAllExpense();
      emit(ExpenseLoadedState(loadedExpenseModels: allExpenses));
    });

    on<FetchFilteredEvent>((event,emit)async{
      emit(ExpenseLoadingState());

      List<ExpenseModels> allExpenses = await dbHelper.fetchAllExpense();

      if(event.type==0)
        {
          df = DateFormat.yMMMd();
        }
      else if(event.type == 1)
        {
          df = DateFormat.yMMM();
        }
      else if(event.type == 2)
        {
          df = DateFormat.y();
        }

      emit(ExpenseFilteredLoadedState(mFilteredExpense: filterExp(allExpenses)));
    });
  }

  List<ExpenseFilterModel> filterExp(List<ExpenseModels> allExpenses)
  {
    /*filteredExpense.clear();*/
    List<ExpenseFilterModel> filteredExpense = [];
    List<String> uniqueDates = [];

    for(ExpenseModels eachExp in allExpenses)
    {
      String eachDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.eDate)));

      if(!uniqueDates.contains(eachDate))
      {
        uniqueDates.add(eachDate);
      }

    }

    print(uniqueDates);

    for(String eachDate in uniqueDates)
    {
      num eachMillis = 0;
      num balance = 0.0;
      List<ExpenseModels> eachDateExp = [];

      for(ExpenseModels eachExp in allExpenses)
      {
        eachMillis = int.parse(eachExp.eDate);
        String eachExpDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.eDate)));

        if(eachExpDate == eachDate)
        {
          eachDateExp.add(eachExp);

          if(eachExp.eType == "Debit")
          {
            balance -= eachExp.eAmount!;
          }
          else
          {
            balance += eachExp.eAmount!;
          }
        }

      }

      print("eachDate: $eachDate");
      print("balance: $balance");
      print("items: ${eachDateExp.length}");

      filteredExpense.add(ExpenseFilterModel(millis: eachMillis, type: eachDate, balance: balance, allExpense: eachDateExp));
    }
    return filteredExpense;
  }

}