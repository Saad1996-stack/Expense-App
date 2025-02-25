import '../../data_local/models/expense_models.dart';

class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent
{
  ExpenseModels newAddExpModelEvent;
  AddExpenseEvent({required this.newAddExpModelEvent});
}

class FetchInitialEvent extends ExpenseEvent {}