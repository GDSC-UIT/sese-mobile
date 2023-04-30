import 'package:sese/app/data/models/sub_category.dart';

class AppCategoryModel {
  String id;
  String name;
  String imageUrl;
  Map<String, SubCategory> subCategory;
  AppCategoryModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.subCategory});
}
