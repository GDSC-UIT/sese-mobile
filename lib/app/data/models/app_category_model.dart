import 'package:sese/app/data/models/subCategory_model.dart';

class AppCategoryModel {
  String id;
  String name;
  String imageUrl;
  String icon;
  Map<String, SubCategory> subCategory;
  AppCategoryModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.icon,
      required this.subCategory});
}
