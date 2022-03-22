import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  RxBool genderCheckbox = false.obs; 
  var nameInputController = TextEditingController().obs;
  var dateInputController = TextEditingController().obs;
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
