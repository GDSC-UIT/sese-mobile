import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/core/values/app_values.dart';

import 'dart:convert';

class LoginController extends GetxController {
  var nameInputController = TextEditingController().obs;
  var dateInputController = TextEditingController().obs;
  var schoolInputController = TextEditingController().obs;
  var emailInputController = TextEditingController().obs;
  var phoneInputController = TextEditingController().obs;
  var interestFavourite = [].obs;
  var recommendUniName = [].obs;
  var listOfInterest = [].obs;
  RxString searchKey = ''.obs;

  List<String> universityName = [
    'University of Technology',
    'University of Science',
    'University of Infomation Technology',
    'International University',
    'University of Technology and Education'
  ];

  void toggleSelectInterest(index) {
    var interestChange = listOfInterest[index];
    print('${interestChange['isSelected']}');
    interestChange['isSelected'] = !interestChange['isSelected'];
    listOfInterest[index] = interestChange;
  }

  void searchSchool() {
    recommendUniName.value = universityName.where((element) {
      return element.contains(searchKey);
    }).toList();
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
    }
  }

  Future<void> facebookLoginAction() async {
    try {
      print('sign in with face');
      User? user = await AuthService.instance.facebookLogin();
      if (user != null) {
        String idToken = await user.getIdToken(true); //get idToken from user

        // get response user info from server
        var response = await HttpService.postRequest(
          body: jsonEncode(<String, String>{
            'idToken': idToken,
          }),
          url: UrlValue.appUrlLoginSocial,
        );
        //decode response
        var body = json.decode(response.body);

        //get user info store to data center
        DataCenter.user = body['user'];
        print('userCenter:${DataCenter.user}');

        //set accessToken
        AuthService.instance.saveAccessToken(body['accessToken'].toString());
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
        print(idToken);
        // get response user info from server
        var response = await HttpService.postRequest(
          body: jsonEncode(<String, String>{
            'idToken': idToken,
          }),
          url: UrlValue.appUrlLoginSocial,
        );
        print(response.body);
        //decode response
        var body = json.decode(response.body);

        //get user info store to data center
        DataCenter.user = body['user'];
        print('userCenter:${DataCenter.user}');

        //set accessToken
        AuthService.instance.saveAccessToken(body['accessToken'].toString());
      }
    } catch (e) {
      print('errorGG: $e');
    }
  }

  Future<void> updateUserInfoWithOutEvidence() async {
    var favouriteListInterests =
        listOfInterest.where((e) => e["isSelected"] == true).toList();
    Map<String, dynamic> userInfo = {
      "name": nameInputController.value.text,
      "phoneNumber": phoneInputController.value.text,
      "university": schoolInputController.value.text,
      "isVerified": true,
      "interestedCategories":
          favouriteListInterests.map((e) => e["_id"]).toList(),
    };
    print("userinfo:$userInfo");
    //update user info
    var response = await HttpService.putRequest(
      body: jsonEncode(userInfo),
      url: UrlValue.appUrlUpdateUserProfile,
    );
    //decode response
    var body = json.decode(response.body);
    //get user info store to data center
    DataCenter.user = body['user'];
    print('userCenter:${DataCenter.user}');
  }
}
