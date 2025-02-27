import 'expense_models.dart';

class ExpenseFilterModel
{
  num millis;
  String type;
  num balance;
  List<ExpenseModels> allExpense;

  ExpenseFilterModel({required this.millis, required this.type, required this.balance, required this.allExpense});

}