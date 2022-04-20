import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/http_service.dart';

class EditProfileController extends GetxController {
  RxBool genderCheckbox = false.obs;
  var nameInputController = TextEditingController().obs;
  var schoolInputController = TextEditingController().obs;
  var dateInputController = TextEditingController().obs;
  var emailInputController = TextEditingController().obs;
  RxList<Map> listGender = [
    {"gender": "Nam", "isSelected": false},
    {"gender": "Nữ", "isSelected": false},
    {"gender": "Khác", "isSelected": false}
  ].obs;
  var recommendUniName = [].obs;

  List<String> universityName = [
    'Đại học bách khoa',
    'Đại học khoa học tự nhiên',
    'Đại học công nghệ thông tin',
    'Đại học quốc tế',
    'Đại học sư phạm kĩ thuật'
  ];
  var listOfInterest = [].obs;

  RxString searchKey = ''.obs;

  void searchSchool() {
    recommendUniName.value = universityName.where((element) {
      return element.contains(searchKey);
    }).toList();
  }

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

  Future<void> facebookLoginAction() async {
    try {
      print('sign in with face');
      User? user = await AuthService.instance.facebookLogin();
      if (user != null) {
        String idToken = await user.getIdToken(true); //get idToken from user

        var response = await HttpService.postRequest(
          body: jsonEncode(<String, String>{
            'idToken': '$idToken',
          }),
          url: UrlValue.appUrlLoginSocial,
        );

        AuthService.instance.saveAccessToken(
            json.decode(response.body)['accessToken'].toString());
      }
    } catch (e) {
      print('fbErorr:$e');
    }
  }

  Future<void> googleSignInAction() async {
    try {
      User? user = await AuthService.instance.googleSignIn();
      if (user != null) {
        String idToken = await user.getIdToken(true); //get idToken from user

        var response = await HttpService.postRequest(
          body: jsonEncode(<String, String>{
            'idToken': '$idToken',
          }),
          url: UrlValue.appUrlLoginSocial,
        );
        //set accessToken

        AuthService.instance.saveAccessToken(
            json.decode(response.body)['accessToken'].toString());
      }
    } catch (e) {
      print('errorGG: $e');
    }
  }
}
