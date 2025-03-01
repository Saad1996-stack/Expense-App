import 'package:expense_tracker_app/data_local/database/dbhelper.dart';
import 'package:expense_tracker_app/data_local/models/category_model.dart';
import 'package:expense_tracker_app/data_local/models/expense_models.dart';
import 'package:expense_tracker_app/domain/app_constants.dart';
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
          emit(ExpenseFilteredLoadedState(mFilteredExpense: filterExp(allExpenses, 0)));
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

      emit(ExpenseFilteredLoadedState(mFilteredExpense: filterExp(allExpenses, event.type)));
    });
  }

  List<ExpenseFilterModel> filterExp(List<ExpenseModels> allExpenses, int type)
  {
    /*filteredExpense.clear();*/
    List<ExpenseFilterModel> filteredExpense = [];

    if(type<3)
      {
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
          num balance = 0.0;
          List<ExpenseModels> eachDateExp = [];

          for(ExpenseModels eachExp in allExpenses)
          {
            String eachExpDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.eDate)));

            if(eachExpDate == eachDate)
            {
              eachDateExp.add(eachExp);

              if(eachExp.eType == "Debit")
              {
                balance -= eachExp.eAmount;
              }
              else
              {
                balance += eachExp.eAmount;
              }
            }

          }

          print("eachDate: $eachDate");
          print("balance: $balance");
          print("items: ${eachDateExp.length}");

          filteredExpense.add(ExpenseFilterModel(type: eachDate, balance: balance, allExpense: eachDateExp));
        }
      }

    ///Category Wise

    else
      {
        var uniqueCat = AppConstants.mCat;

        for(CategoryModel eachCat in uniqueCat)
          {
            num balance = 0.0;
            List<ExpenseModels> eachCatExp = [];

            for(ExpenseModels eachExp in allExpenses)
              {
                if(eachCat.category_id == eachExp.eCategoryId)
                  {
                    eachCatExp.add(eachExp);

                    if(eachExp.eType == "Debit")
                      {
                        balance -= eachExp.eAmount;
                      }
                    else
                      {
                        balance += eachExp.eAmount;
                      }
                  }
              }

            filteredExpense.add(ExpenseFilterModel(type: eachCat.category_title, balance: balance, allExpense: eachCatExp));
          }
      }

    return filteredExpense;
  }

}