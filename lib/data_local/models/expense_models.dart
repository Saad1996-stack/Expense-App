import 'package:expense_tracker_app/data_local/database/dbhelper.dart';

class ExpenseModels {
  int eId;
  int userId;
  int eCategoryId;
  String eTitle;
  String eDesc;
  String eType;
  String eDate;
  double eAmount;
  double eBalance;

  ExpenseModels(
      {required this.eDate,
      required this.eCategoryId,
      required this.userId,
      this.eId = 0,
      required this.eTitle,
      required this.eDesc,
      required this.eAmount,
      required this.eBalance,
      required this.eType});

  factory ExpenseModels.fromMap(Map<String, dynamic> map) {
    return ExpenseModels(
      eId: map[DBHelper.COLUMN_EXPENSE_ID],
      eTitle: map[DBHelper.COLUMN_EXPENSE_TITLE],
      eDesc: map[DBHelper.COLUMN_EXPENSE_DESC],
      eAmount: map[DBHelper.COLUMN_EXPENSE_AMOUNT],
      eBalance: map[DBHelper.COLUMN_EXPENSE_BALANCE],
      eType: map[DBHelper.COLUMN_EXPENSE_TYPE],
      eDate: map[DBHelper.COLUMN_EXPENSE_DATE],
      eCategoryId: map[DBHelper.COLUMN_EXPENSE_CATEGORY_ID],
      userId: map[DBHelper.COLUMN_EXPENSE_FK_USER_ID],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.COLUMN_EXPENSE_FK_USER_ID : userId,
      DBHelper.COLUMN_EXPENSE_TITLE: eTitle,
      DBHelper.COLUMN_EXPENSE_DESC: eDesc,
      DBHelper.COLUMN_EXPENSE_AMOUNT: eAmount,
      DBHelper.COLUMN_EXPENSE_BALANCE: eBalance,
      DBHelper.COLUMN_EXPENSE_TYPE: eType,
      DBHelper.COLUMN_EXPENSE_DATE: eDate,
      DBHelper.COLUMN_EXPENSE_CATEGORY_ID: eCategoryId,

    };
  }
}
