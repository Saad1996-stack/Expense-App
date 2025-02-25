import 'package:expense_tracker_app/data_local/database/dbhelper.dart';

class UserModel {
  int? userId;
  String userName;
  String uEmail;
  String uPassword;
  String uPhone;
  String uCreatedAt;

  UserModel(
      {required this.userName,
      required this.uEmail,
      required this.uPassword,
      required this.uPhone,
      required this.uCreatedAt,
      this.userId});

  ///from Database
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map[DBHelper.COLUMN_USER_ID],
      userName: map[DBHelper.COLUMN_USER_NAME],
      uEmail: map[DBHelper.COLUMN_USER_EMAIL],
      uPassword: map[DBHelper.COLUMN_USER_PASSWORD],
      uPhone: map[DBHelper.COLUMN_USER_PHONE_NO],
      uCreatedAt: map[DBHelper.COLUMN_USER_CREATED_AT],
    );
  }

  ///to Database
  Map<String, dynamic> toMap() {
    return {
      DBHelper.COLUMN_USER_NAME: userName,
      DBHelper.COLUMN_USER_EMAIL: uEmail,
      DBHelper.COLUMN_USER_PASSWORD: uPassword,
      DBHelper.COLUMN_USER_PHONE_NO: uPhone,
      DBHelper.COLUMN_USER_CREATED_AT: uCreatedAt,
    };
  }
}
