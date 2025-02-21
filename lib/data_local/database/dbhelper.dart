import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper
{
  ///Table UserName
  static const String TABLE_USER = "user";

  ///Column Name
  static const String COLUMN_USER_ID = "user_id";
  static const String COLUMN_USER_NAME  = "user_name";
  static const String COLUMN_USER_EMAIL = "user_email";
  static const String COLUMN_PASSWORD = "password";
  static const String COLUMN_USER_PHONE_NO = "phone";
  static const String COLUMN_USER_CREATED_AT  = "created_at";

  ///Table Expense
  static const String TABLE_EXPENSE = "expense";

  ///Column Name
  static const String COLUMN_EXPENSE_ID =  "expense_id";
  static const String COLUMN_EXPENSE_TITLE = "expense_title";
  static const String COLUMN_EXPENSE_DESC = "expense_desc";
  static const String COLUMN_EXPENSE_AMOUNT = "expense_amount";
  static const String COLUMN_EXPENSE_BALANCE  = "expense_balance";
  static const String COLUMN_EXPENSE_TYPE = "expense_type";
  static const String COLUMN_EXPENSE_DATE = "expense_date";
  static const String COLUMN_EXPENSE_CATEGORY_ID = "expense_cat_id";
  static const String COLUMN_EXPENSE_USER_ID = "user_id";

  ///Table Name
  static const String TABLE_CATEGORY = "category";

  ///Column Name
  static const String COLUMN_CATEGORY_ID = "category_id";
  static const String COLUMN_CATEGORY_TITLE = "category_title";
  static const String COLUMN_CATEGORY_IMAGE = "category_image";

  Database? mDB;

  Future<Database>getDB()
  async{
    return mDB ?? await openDB();
  }


  Future<Database>openDB()
  async{
    var appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "mainDB.db");

    return openDatabase(dbPath, version: 1, onCreate: (db,version){
      ///Table UserName
      db.execute("create table $TABLE_USER ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text, $COLUMN_USER_EMAIL text, $COLUMN_PASSWORD text, $COLUMN_USER_PHONE_NO text, $COLUMN_USER_CREATED_AT text )");

      ///Table Expense
      db.execute("create table $TABLE_EXPENSE ( $COLUMN_EXPENSE_ID integer primary key autoincrement, $COLUMN_EXPENSE_USER_ID integer foreign key, $COLUMN_EXPENSE_TITLE text, $COLUMN_EXPENSE_DESC text, $COLUMN_EXPENSE_AMOUNT real, $COLUMN_EXPENSE_BALANCE real, $COLUMN_EXPENSE_TYPE text, $COLUMN_EXPENSE_DATE text, $COLUMN_EXPENSE_CATEGORY_ID integer )");
    });
  }

}