import 'package:flutter/foundation.dart';
import 'package:sese/app/data/models/app_category_model.dart';
import 'package:sese/app/data/models/category_model.dart';

import '../models/subCategory_model.dart';

class DataCenter {
  static Map<String, AppCategoryModel> appCategory = {};
  static Map<String, SubCategory?> appSubCategory = {};
  static Map<String, dynamic> user = {};
}
