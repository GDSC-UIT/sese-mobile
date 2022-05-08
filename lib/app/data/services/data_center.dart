import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/models/app_category_model.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/data/services/http_service.dart';

import '../models/subCategory_model.dart';

class DataCenter {
  static Map<String, AppCategoryModel> appCategory = {};
  static Map<String, SubCategory?> appSubCategory = {};
  static Map<String, dynamic> user = {};

  static void setCategoryToDataCenter(listCategories) {
    listCategories.forEach((item) {
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
      DataCenter.appCategory[item["_id"]] = AppCategoryModel(
          id: item['_id'],
          imageUrl: item['image'],
          name: item['name'],
          subCategory: subCategory);
    });
  }
}
