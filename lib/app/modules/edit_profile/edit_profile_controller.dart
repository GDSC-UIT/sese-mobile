import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  RxBool genderCheckbox = false.obs;
  var nameInputController = TextEditingController().obs;
  var dateInputController = TextEditingController().obs;
  RxList<Map> listGender = [
    {"gender": "Nam", "isSelected": false},
    {"gender": "Nữ", "isSelected": false},
    {"gender": "Khác", "isSelected": false}
  ].obs;

  void toggleSelectedGender(index) {
    var temListItem = listGender[index];
    temListItem["isSelected"] = !temListItem["isSelected"];
    listGender[index] = temListItem;
  }

  Future<void> datePicker(context) async {
    DateFormat formatter = DateFormat('dd/MM/yyyy');

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(2022, 12, 30),
    );
    if (picked != null && picked != DateTime.now()) {
      dateInputController.value.value =
          TextEditingValue(text: formatter.format(picked));
      print('${dateInputController.value.value.text}');
    }
  }
}
