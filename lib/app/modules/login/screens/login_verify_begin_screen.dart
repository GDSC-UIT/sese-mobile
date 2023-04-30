import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/login/login_controller.dart';

import '../../../core/values/app_colors.dart';

class LoginVerifyBeginScreen extends StatelessWidget {
  LoginVerifyBeginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.backIcon,
              size: 30,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(
                  "Verification",
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                ),
                child: Text(
                  "I want to use this for verification:",
                  style: CustomTextStyle.t8(Colors.black),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.032,
              ),
              AppButton(
                  onPress: () {},
                  text: "STUDENT CARD",
                  //  textColor: AppColors.primaryColor,
                  backgroundColor: AppColors.lightOrange,
                  borderColor: AppColors.primaryColor,
                  textStyle: CustomTextStyle.t8(AppColors.primaryColor)),
              SizedBox(
                height: screenHeight * 0.032,
              ),
              AppButton(
                onPress: () {},
                text: "CMND/CCCD",
                textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
              ),
              SizedBox(
                height: screenHeight * 0.076,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    try {
                      var favouriteListInterests = loginController
                          .listOfInterest
                          .where((e) => e["isSelected"] == true)
                          .toList();
                      Map<String, dynamic> userInfo = {
                        "name": loginController.nameInputController.value.text,
                        "phoneNumber":
                            loginController.phoneInputController.value.text,
                        "birthDate":
                            loginController.dateInputController.value.text,
                        "university":
                            loginController.schoolInputController.value.text,
                        "interestedCategories":
                            favouriteListInterests.map((e) => e["_id"]),
                      };
                      log('userInfo:$userInfo');
                      var response = await HttpService.putRequest(
                        body: jsonEncode(
                          userInfo,
                        ),
                        url: UrlValue.appUrlUpdateUserProfile,
                      );
                      log('response:${response.body}');
                    } catch (e) {
                      Get.snackbar('Error', '$e');
                    }
                  },
                  child: const Text(
                    "Mình sẽ xác thực sau nha",
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.greenColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
