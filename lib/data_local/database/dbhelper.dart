import 'package:expense_tracker_app/data_local/models/expense_models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

class DBHelper {
  ///Table UserName
  static const String TABLE_USER = "user";

  ///Column Name
  static const String COLUMN_USER_ID = "user_id";
  static const String COLUMN_USER_NAME = "user_name";
  static const String COLUMN_USER_EMAIL = "user_email";
  static const String COLUMN_USER_PASSWORD = "password";
  static const String COLUMN_USER_PHONE_NO = "phone";
  static const String COLUMN_USER_CREATED_AT = "created_at";

  ///Table Expense
  static const String TABLE_EXPENSE = "expenseTable";

  ///Column Name
  static const String COLUMN_EXPENSE_ID = "expense_id";
  static const String COLUMN_EXPENSE_TITLE = "expense_title";
  static const String COLUMN_EXPENSE_DESC = "expense_desc";
  static const String COLUMN_EXPENSE_AMOUNT = "expense_amount";
  static const String COLUMN_EXPENSE_BALANCE = "expense_balance";
  static const String COLUMN_EXPENSE_TYPE = "expense_type";
  static const String COLUMN_EXPENSE_DATE = "expense_date";
  static const String COLUMN_EXPENSE_CATEGORY_ID = "expense_cat_id";
  static const String COLUMN_EXPENSE_FK_USER_ID = "user_id";

  ///Table Name
  static const String TABLE_CATEGORY = "category";

  ///Column Name
  static const String COLUMN_CATEGORY_ID = "category_id";
  static const String COLUMN_CATEGORY_TITLE = "category_title";
  static const String COLUMN_CATEGORY_IMAGE = "category_image";

  DBHelper._();
  static DBHelper getInstance() => DBHelper._();

  Database? mDB;

  Future<Database> getDB() async {
    return mDB ?? await openDB();
  }

  Future<Database> openDB() async {
    var appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "mainDB.db");

    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      ///Table UserName
      db.execute(
          "create table $TABLE_USER ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text, $COLUMN_USER_EMAIL text, $COLUMN_USER_PASSWORD text, $COLUMN_USER_PHONE_NO text, $COLUMN_USER_CREATED_AT text )");

      ///Table Expense
      db.execute(
          "create table $TABLE_EXPENSE ( $COLUMN_EXPENSE_ID integer primary key autoincrement, $COLUMN_EXPENSE_FK_USER_ID integer, $COLUMN_EXPENSE_TITLE text, $COLUMN_EXPENSE_DESC text, $COLUMN_EXPENSE_AMOUNT real, $COLUMN_EXPENSE_BALANCE real, $COLUMN_EXPENSE_TYPE text, $COLUMN_EXPENSE_DATE text, $COLUMN_EXPENSE_CATEGORY_ID integer )");

      ///Table Category
      db.execute(
        "create table $TABLE_CATEGORY ( $COLUMN_CATEGORY_ID integer primary key autoincrement, $COLUMN_CATEGORY_TITLE text, $COLUMN_CATEGORY_IMAGE text )");

    });

  }

  ///Fetch all user data

  Future<List<UserModel>>fetchAllUser()
  async{
    var db = await getDB();
    List<Map<String,dynamic>>mUserData = await db.query(TABLE_USER);
    List<UserModel>mUserModel = [];

    for(int i=0; i<mUserData.length; i++)
      {
        UserModel eachUser = UserModel.fromMap(mUserData[i]);
        mUserModel.add(eachUser);
      }
    return mUserModel;
  }

  ///User Registration
  Future<bool>registerUser({required UserModel user}) async {
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_USER, user.toMap());
    return rowsEffected > 0;

    /* ///I want to directly show in the UI that the user's email already exists.So that's why I'm commenting on this.
    if(! await isUserAlreadyRegistered(email: user.uEmail, phoneNo: user.uPhone))
      {
        int rowsEffected = await db.insert(TABLE_USER, user.toMap());
        return rowsEffected>0;
      }
    else
      {
        return false;
      }*/
  }

  ///Check if user already exists
  Future<bool> isUserAlreadyRegistered(
      {required String email, required String phoneNo}) async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(TABLE_USER,
        where: "$COLUMN_USER_EMAIL = ? OR $COLUMN_USER_PHONE_NO = ?",
        whereArgs: [email, phoneNo]);
    return mData.isNotEmpty;
    /*if(mData.isNotEmpty)
      {
        return true;
      }
    else
      {
        return false;
      }*/
  }

  Future<bool>authenticateUser({required String email, required String password}) async {
    var db = await getDB();
    List<Map<String,dynamic>> mData = await db.query(TABLE_USER,
        where: "$COLUMN_USER_EMAIL = ? AND $COLUMN_USER_PASSWORD = ?",
        whereArgs: [email, password]);

    ///to manage session store uid in Shared prefs
    if(mData.isNotEmpty)
      {
        var prefs = await SharedPreferences.getInstance();
        prefs.setInt("user_id", mData[0][COLUMN_USER_ID]);
      }

    return mData.isNotEmpty;
  }

  ///Add Expense

  Future<bool>addExpense({required ExpenseModels expense})
  async{
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_EXPENSE, expense.toMap());
    return rowsEffected>0;
  }


  ///fetch all Expenses
  Future<List<ExpenseModels>> fetchAllExpense()
  async{
    var db = await getDB();
    ///Now, data is coming at every index of this list
    List<Map<String,dynamic>> mData = await db.query(TABLE_EXPENSE, orderBy: "$COLUMN_EXPENSE_DATE DESC");

    ///List data convert into Model
    List<ExpenseModels> mExpenses = [];

    ///And we will add it to the list and send it.
    for(int i=0; i<mData.length; i++)
      {
        ExpenseModels eachExpenseModel = ExpenseModels.fromMap(mData[i]);
        mExpenses.add(eachExpenseModel);
      }
    return mExpenses;
  }


}
