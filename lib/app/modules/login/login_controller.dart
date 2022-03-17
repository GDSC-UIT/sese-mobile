import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'dart:convert';

class LoginController extends GetxController {
  RxString loginMethod = ''.obs;
  var nameInputController = TextEditingController().obs;
  var dateInputController = TextEditingController().obs;
  var schoolInputController = TextEditingController().obs;
  var recommendUniName = [].obs;
  List<String> universityName = [
    'Đại học bách khoa',
    'Đại học khoa học tự nhiên',
    'Đại học công nghệ thông tin',
    'Đại học quốc tế',
    'Đại học sư phạm kĩ thuật'
  ];
  RxString searchKey = ''.obs;
  @override
  void onReady() {
    //check is User loged in
    // AuthService.instance.checkLogin();
    // if (AuthService.instance.isLogined) {
    //   Get.toNamed(AppRoutes.authName);
    // } else {
    //   Get.toNamed(AppRoutes.authBegin);
    // }
    super.onInit();
  }

  void searchSchool() {
    recommendUniName = universityName
        .where((element) {
          return element.contains(searchKey);
        })
        .toList()
        .obs;
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
        print('idToken:$idToken');

        HttpService.postRequest(
            body: jsonEncode(<String, String>{
              'idToken': '$idToken',
            }),
            url: 'https://messchill.herokuapp.com/api/auth/login/social');
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
        print('idToken:$idToken');

        HttpService.postRequest(
            body: jsonEncode(<String, String>{
              'idToken': '$idToken',
            }),
            url: 'https://messchill.herokuapp.com/api/auth/login/social');
      }
    } catch (e) {
      print('errorGG: $e');
    }
  }
}
