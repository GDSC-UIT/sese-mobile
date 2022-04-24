import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/http_service.dart';

import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/verify/verify_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

import '../../../core/values/app_values.dart';

class VerifySuccessScreen extends StatelessWidget {
  VerifyController verifyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: Assets.imagesVerifySuccess,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Welcome to Se Sẻ!",
                  style: CustomTextStyle.h2(Colors.black),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  width: 251,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Your account is now being processed.",
                          style: CustomTextStyle.t5(AppColors.neutralGrey),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "We will notify you after 24 hours.",
                          style: CustomTextStyle.t5(AppColors.neutralGrey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                AppButton(
                  onPress: () async {
                    try {
                      HttpService.showLoadingIndecator();
                      //upload image to firebase and call put Api
                      await verifyController.addEvidence();

                      //Get data for home
                      List listData =
                          await AuthService.instance.getDataForHomeScreen();
                      Get.back();
                      Get.offAllNamed(AppRoutes.home, arguments: listData);
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        'Something went wrong, ${e.toString()}',
                        duration: const Duration(seconds: 30),
                      );
                      print('loi:${e.toString()}');
                    }
                  },
                  text: "LET'S GET STARTED",
                  textStyle: CustomTextStyle.t8(Colors.white),
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
