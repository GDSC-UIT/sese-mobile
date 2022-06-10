import 'package:sese/app/data/models/app_category_model.dart';

import '../models/subCategory_model.dart';

class DataCenter {
  static Map<String, AppCategoryModel> appCategory = {};
  static Map<String, SubCategory?> appSubCategory = {};
  static Map<String, dynamic> user = {};
  static List<AppCategoryModel> listAppCategory = [];
  static var errorImage =
      "https://www.investo.vn/wp-content/uploads/2022/04/google2.0.0.jpg";

  static void setCategoryToDataCenter(listCategories) {
    listCategories.forEach(
      (item) {
        //set  isSelect property
        item['isSelected'] = false;

        //get subcategoryList
        var subCategoriesList = item["subcategories"];
        //create subCategory
        Map<String, SubCategory> subCategory = {};
        subCategoriesList.forEach((sub) {
          //get params of sub
          var subParam = sub["params"];
          Map<String, dynamic> params = {};
          //loop subParam
          subParam.forEach((param) {
            params[param["param"]] = param;
          });
          //create subCategory
          subCategory[sub["_id"]] = SubCategory(
            category: sub["category"],
            name: sub["name"],
            id: sub["_id"],
            params: params,
          );
          DataCenter.appSubCategory[subCategory[sub["_id"]]!.id] =
              subCategory[sub["_id"]];
        });
        var appCategoryModel = AppCategoryModel(
          id: item['_id'],
          imageUrl: item['image'],
          name: item['name'],
          subCategory: subCategory,
          icon: item['icon'],
        );
        DataCenter.appCategory[item["_id"]] = appCategoryModel;
        listAppCategory.add(appCategoryModel);
      },
    );
  }
}
