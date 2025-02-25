import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data_local/models/expense_models.dart';

@immutable
sealed class ExpenseState {}

final class ExpenseInitialState extends ExpenseState{}

final class ExpenseLoadingState extends ExpenseState{}

final class ExpenseLoadedState  extends ExpenseState
{
  List<ExpenseModels> loadedExpenseModels;
  ExpenseLoadedState({required this.loadedExpenseModels});
}
final class ExpenseErrorState extends ExpenseState
{
  String errorMessageState;
  ExpenseErrorState({required this.errorMessageState});
}