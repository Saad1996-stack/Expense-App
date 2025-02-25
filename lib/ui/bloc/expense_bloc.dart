import 'package:expense_tracker_app/data_local/database/dbhelper.dart';
import 'package:expense_tracker_app/data_local/models/expense_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState>
{
  DBHelper dbHelper;

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()){

    on<AddExpenseEvent>((event, emit)async{

      emit(ExpenseLoadingState());
      bool check = await dbHelper.addExpense(expense: event.newAddExpModelEvent);
      if(check)
        {
          List<ExpenseModels> allExpenses = await dbHelper.fetchAllExpense();
          emit(ExpenseLoadedState(loadedExpenseModels: allExpenses));
        }
      else
        {
          emit(ExpenseErrorState(errorMessageState: "Expense Not Added"));
        }
    });

    on<FetchInitialEvent>((event,emit)async{
      emit(ExpenseLoadingState());

      List<ExpenseModels> allExpense = await dbHelper.fetchAllExpense();
      emit(ExpenseLoadedState(loadedExpenseModels: allExpense));
    });
  }

}