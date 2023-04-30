import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/data/services/auth_service.dart';

import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

class ChangeLinkAccountScreen extends StatelessWidget {
  final EditProfileController editProfileController = Get.find();
  ChangeLinkAccountScreen({Key? key}) : super(key: key);

  get loginController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Tài khoản liên kết",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        height: 158,
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: AppButton(
              textStyle: CustomTextStyle.t8(AppColors.darkGreyColor),
              onPress: () async {
                await editProfileController.googleSignInAction();
                AuthService.instance.isLogined == true
                    ? Get.toNamed(AppRoutes.authName)
                    : log('Login gg fail');
              },
              text: 'LOGIN WITH GOOGLE',
              // textColor: AppColors.darkGreyColor,
              borderColor: AppColors.greenColor,
              icon: Image.asset(
                'assets/images/google_icon.png',
                scale: 0.5,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: AppButton(
              textStyle: CustomTextStyle.t8(AppColors.darkGreyColor),
              onPress: () async {
                await loginController.facebookLoginAction();
                AuthService.instance.isLogined == true
                    ? Get.toNamed(AppRoutes.authName)
                    : log('Login facebook fail');
              },
              text: 'LOGGIN WITH FACEBOOK',
              // textColor: AppColors.darkGreyColor,
              borderColor: AppColors.greenColor,
              icon: Image.asset(
                'assets/images/facebook_icon.png',
                scale: 0.5,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
