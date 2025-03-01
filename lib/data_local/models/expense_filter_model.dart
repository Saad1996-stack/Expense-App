import 'expense_models.dart';

class ExpenseFilterModel
{
  String type;
  num balance;
  List<ExpenseModels> allExpense;

  ExpenseFilterModel({required this.type, required this.balance, required this.allExpense});

}