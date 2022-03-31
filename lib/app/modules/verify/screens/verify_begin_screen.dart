import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/modules/verify/verify_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/app_button.dart';

class VerifyBeginScreen extends StatelessWidget {
  final VerifyController verifyController = Get.put(VerifyController());

  VerifyBeginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: _screenHeight * 0.05,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.backIcon,
                  size: 30,
                ),
              ),
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
                  style: CustomTextStyle.t4(Colors.black),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.032,
              ),
              AppButton(
                onPress: () {
                  verifyController.typeCard = "student card";
                  Get.toNamed(AppRoutes.verifyFrontSv);
                },
                text: "STUDENT CARD",
                textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
                borderThickness: 1,
              ),
              SizedBox(
                height: _screenHeight * 0.032,
              ),
              AppButton(
                onPress: () {
                  verifyController.typeCard = "citizen identity card";
                  Get.toNamed(AppRoutes.verifyFrontSv);
                },
                text: "CITIZEN IDENTITY CARD",
                textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
                borderThickness: 1,
              ),
              SizedBox(
                height: _screenHeight * 0.032,
              ),
              AppButton(
                onPress: () {
                  verifyController.typeCard = "identity card";
                  Get.toNamed(AppRoutes.verifyFrontSv);
                },
                text: "IDENTITY CARD",
                textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
                borderThickness: 1,
              ),
              SizedBox(
                height: _screenHeight * 0.076,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.home);
                  },
                  child: const Text(
                    "I Will Do It Later",
                    style: TextStyle(
                      fontSize: 11,
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
