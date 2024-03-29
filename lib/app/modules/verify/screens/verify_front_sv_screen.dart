import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_constant.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/modules/verify/verify_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../global_widgets/app_button.dart';

class VerifyFrontSvScreen extends StatelessWidget {
  final VerifyController verifyController = Get.find();

  VerifyFrontSvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: AppConstant.gapBackButtonHeader,
                ),
                Text(
                  "Verification",
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
                const SizedBox(
                  height: 23,
                ),
                Text(
                  "Take a photo of the front of your ${verifyController.typeCard}",
                  style: CustomTextStyle.t4(Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 276,
                    width: 214,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: Assets.imagesDoDienTu,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 53,
                ),
                AppButton(
                  onPress: () {
                    verifyController.pickFrontImage(ImageSource.camera);
                  },
                  text: "CAPTURE",
                  textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                  backgroundColor: AppColors.lightOrange,
                  borderColor: AppColors.primaryColor,
                  borderThickness: 1,
                ),
                const SizedBox(
                  height: 17,
                ),
                AppButton(
                  onPress: () {
                    verifyController.pickFrontImage(ImageSource.gallery);
                  },
                  text: "CHOOSE FROM LIBRARY",
                  textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                  backgroundColor: AppColors.lightOrange,
                  borderColor: AppColors.primaryColor,
                  borderThickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
