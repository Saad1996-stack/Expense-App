import 'package:expense_tracker_app/data_local/database/dbhelper.dart';

class CategoryModel {
  int category_id;
  String category_title;
  String category_image;

  CategoryModel
      ({required this.category_id,
      required this.category_title,
      required this.category_image}
      );

  factory CategoryModel.fromMap(Map<String,dynamic>map)
  {
    return CategoryModel(
        category_id: map[DBHelper.COLUMN_CATEGORY_ID],
        category_title: map[DBHelper.COLUMN_CATEGORY_TITLE],
        category_image: map[DBHelper.COLUMN_CATEGORY_IMAGE],
    );
  }

  Map<String,dynamic>toMap()
  {
    return
        {
          DBHelper.COLUMN_CATEGORY_TITLE : category_title,
          DBHelper.COLUMN_CATEGORY_IMAGE : category_image,
        };
  }

}
