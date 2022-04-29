import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:sese/app/data/models/app_category_model.dart';
import 'package:sese/app/data/models/subCategory_model.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/core/values/app_values.dart';

import 'dart:convert';

import 'package:sese/app/routes/app_routes.dart';

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

  @override
  void onInit() async {
    print("call onInit");
    if (AuthService.instance.isLogined) {
      AuthService.instance.readAccessToken();
      print(
          "access Token in login Controller: ${AuthService.instance.accessToken}");
      //get user info by accesstoken
      var response =
          await HttpService.getRequest(UrlValue.appUrlGetUserInfoAccessToken);
      //set info user for data center
      print("userInfo:${response.body}");
      DataCenter.user = jsonDecode(response.body)["user"];

      //var response = await HttpService.getRequest(url)
      //Get data for home
      List listData = await AuthService.instance.getDataForHomeScreen();
      Get.offAllNamed(AppRoutes.home, arguments: listData);
      //Get.offAllNamed(AppRoutes.editUserProfile);

    } else {
      print("not login");
    }
    super.onInit();
  }

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

  void setCategoryToDataCenter(listInterests) {
    listInterests.forEach((item) {
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

  Future<void> updateUserInfoWithOutEvidence() async {
    var favouriteListInterests =
        listOfInterest.where((e) => e["isSelected"] == true).toList();
    Map<String, dynamic> userInfo = {
      "name": nameInputController.value.text,
      "phoneNumber": phoneInputController.value.text,
      "university": schoolInputController.value.text,
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
