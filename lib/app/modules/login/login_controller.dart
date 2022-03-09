import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'dart:convert';

import 'package:sese/app/routes/app_pages.dart';
import 'package:sese/app/routes/app_routes.dart';

class LoginController extends GetxController {
  RxString loginMethod = ''.obs;
  @override
  void onReady() {
    //check is User loged in
    AuthService.instance.checkLogin();
    if (AuthService.instance.isLogined) {
      Get.toNamed(AppRoutes.home);
    } else {
      Get.toNamed(AppRoutes.authBegin);
    }
    super.onInit();
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
