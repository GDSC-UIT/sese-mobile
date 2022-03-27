import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/data/services/upload_image_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/verify/verify_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

import '../../../core/values/app_values.dart';

class VerifySuccessScreen extends StatelessWidget {
  VerifyController verifyController = Get.find();

  VerifySuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 259,
                ),
                Container(
                  height: 110,
                  width: 110,
                  child: const Icon(
                    Icons.check,
                    size: 70,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Chào mừng bạn đến với",
                  style: CustomTextStyle.h2(Colors.black),
                ),
                Text(
                  "Se Sẻ!",
                  style: CustomTextStyle.h2(Colors.black),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  width: 251,
                  child: Center(
                    child: Text(
                      "Dữ liệu của bạn sẽ được lưu ở chế độ riêng tư và bây giờ bạn có thể tận hưởng tất cả các tính năng của Se Sẻ",
                      style: CustomTextStyle.t5(AppColors.neutralGrey),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                AppButton(
                  onPress: () async {
                    try {
                      // verifyController.frontImageUrl =
                      //     await UploadImageService.uploadImageToFirebase(
                      //         File(verifyController.frontImage.value.path),
                      //         "verify_images");
                      // verifyController.backImageUrl =
                      //     await UploadImageService.uploadImageToFirebase(
                      //         File(verifyController.backImage.value.path),
                      //         "verify_images");
                      // Map<String, dynamic> userVerifyInfo = {
                      //   "type": verifyController.typeCardEnum,
                      //   "frontImg": verifyController.frontImageUrl,
                      //   "backImg": verifyController.backImageUrl,
                      // };
                      // var response = await HttpService.putRequest(
                      //   body: jsonEncode(
                      //     userVerifyInfo,
                      //   ),
                      //   url: UrlValue.appUrlVerifyUser,
                      // );
                      // print("Phat dep chai:  ${response.body}");
                      Get.toNamed(AppRoutes.testImage);
                    } catch (e) {
                      Get.snackbar('Error', 'Something went wrong');
                    }

                    ;
                  },
                  text: "Bắt đầu thôi !",
                  textStyle: CustomTextStyle.t1(Colors.white),
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