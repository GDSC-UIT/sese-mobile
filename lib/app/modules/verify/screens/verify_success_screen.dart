import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/data/services/upload_image_service.dart';
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
                      verifyController.frontImageUrl =
                          await UploadImageService.uploadImageToFirebase(
                                  File(verifyController.frontImage.value.path),
                                  "verify_images") ??
                              'rong';

                      print('frontImg:${verifyController.frontImageUrl}');

                      verifyController.backImageUrl =
                          await UploadImageService.uploadImageToFirebase(
                                  File(verifyController.backImage.value.path),
                                  "verify_images") ??
                              'rong';
                      print('backImg:${verifyController.backImageUrl}');
                      String typeCard = '';

                      //tranfer type of card
                      if (verifyController.typeCardEnum ==
                          TypeCard.citizen_identity_card) {
                        typeCard = 'citizen_identity_card';
                      } else {
                        if (verifyController.typeCardEnum ==
                            TypeCard.identity_card) {
                          typeCard = 'identity_card';
                        } else {
                          typeCard = 'student_card';
                        }
                      }
                      Map<String, dynamic> userVerifyInfo = {
                        'evidence': {
                          "type": typeCard,
                          "frontImg": verifyController.frontImageUrl,
                          "backImg": verifyController.backImageUrl,
                        }
                      };
                      print(userVerifyInfo);

                      var response = await HttpService.putRequest(
                        body: jsonEncode(
                          userVerifyInfo,
                        ),
                        url: UrlValue.appUrlVerifyUser,
                      );

                      print("phát covid: ${response.body}");
                      HttpService.showLoadingIndecator();
                      var responseNew = await HttpService.getRequest(
                          '${UrlValue.appUrlPostProduct}?type=new');
                      var listNewProduct =
                          json.decode(responseNew.body)["posts"];

                      HttpService.showLoadingIndecator();
                      var responseRecommend = await HttpService.getRequest(
                          '${UrlValue.appUrlPostProduct}?type=recommendation');
                      var listRecommendProduct =
                          json.decode(responseRecommend.body)["posts"];
                      Get.toNamed(AppRoutes.home,
                          arguments: [listNewProduct, listRecommendProduct]);
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        'Something went wrong, ${e.toString()}',
                        duration: const Duration(seconds: 30),
                      );
                      print('loi:${e.toString()}');
                    }

                    ;
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
