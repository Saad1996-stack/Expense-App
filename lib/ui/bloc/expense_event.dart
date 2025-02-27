import '../../data_local/models/expense_models.dart';

class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent
{
  ExpenseModels newAddExpModelEvent;
  AddExpenseEvent({required this.newAddExpModelEvent});
}

class FetchInitialEvent extends ExpenseEvent {}

class FetchFilteredEvent extends ExpenseEvent
{
  int type; ///type is a flag
  FetchFilteredEvent({required this.type}); ///0 for date, 1 for month, 2 for year
}