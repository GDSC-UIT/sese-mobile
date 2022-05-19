import 'dart:convert';

import 'package:get/get.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/routes/app_routes.dart';

class OnboadingController extends GetxController {
  RxInt index = 0.obs;
  @override
  void onReady() async {
    // TODO: implement onReady
    // await AuthService.instance.googleSignOut();
    print("call onReady");
    //read access token from local storage
    AuthService.instance.readAccessToken();
    print("isLogin:${AuthService.instance.isLogined}");
    print(
        "access Token in login Controller: ${AuthService.instance.accessToken}");
    if (AuthService.instance.isLogined &&
        AuthService.instance.accessToken != null) {
      //call api to get data user
      var responseUserInfo =
          await HttpService.getRequest(UrlValue.appUrlLoginAccessToken);
      print(responseUserInfo.body);
      //set user info to data center
      DataCenter.user = json.decode(responseUserInfo.body)["data"];
      print(DataCenter.user);
      //Get all category and set to data center
      var responseCategory =
          await HttpService.getRequest(UrlValue.appUrlGetAllCategories);
      var listCategories = json.decode(responseCategory.body)['categories'];
      //set category to data center
      DataCenter.setCategoryToDataCenter(listCategories);
      //Get data for home
      List listData = await AuthService.instance.getDataForHomeScreen();
      Get.offAllNamed(AppRoutes.home, arguments: listData);
    } else {
      AuthService.instance.readIsFirstUse();
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (AuthService.instance.isFirstUse == true) {
          Get.offNamed(AppRoutes.onBoardingContent);
        } else {
          Get.offNamed(AppRoutes.authBegin);
        }
      });
    }

    super.onReady();
  }

  @override
  void onInit() {
    print("call init");
    // TODO: implement onInit
    super.onInit();
  }
}
