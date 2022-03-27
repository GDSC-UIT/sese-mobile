

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var userAddress = TextEditingController().obs;
  var userName = TextEditingController().obs; 
  RxList<Map> listLanguage = [
    {"language": "English", "isSelected": true},
    {"language": "Việt Nam", "isSelected": false},
  ].obs;

  void toggleSelectedLanguage(index) {
    var temListItem = listLanguage[index];
    temListItem["isSelected"] = !temListItem["isSelected"];
    listLanguage[index] = temListItem;
  }
}
