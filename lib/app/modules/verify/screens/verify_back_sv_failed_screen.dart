import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_constant.dart';
import '../../../global_widgets/app_button.dart';
import '../verify_controller.dart';
import '../widgets/dialog_failed.dart';
import '../widgets/image_verify.dart';

class VerifyBackSvFailedScreen extends StatelessWidget {
  VerifyController verifyController = Get.find();

  VerifyBackSvFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showMessage() {
      showDialog(
        context: context,
        builder: (_) => const DialogFailed(),
        barrierDismissible: true,
      );
    }

    Future.delayed(Duration.zero, () => showMessage());
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
                  "Xác thực tài khoản",
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
                const SizedBox(
                  height: 23,
                ),
                Text(
                  "Vui lòng chụp mặt sau ${verifyController.typeCard}",
                  style: CustomTextStyle.t4(Colors.black),
                ),
                const SizedBox(
                  height: 29,
                ),
                Obx(() => ImageVerify(verifyController.image)),
                const SizedBox(
                  height: 109,
                ),
                AppButton(
                  onPress: () {
                    verifyController.pickBackImage(ImageSource.camera);
                  },
                  text: "CHỤP LẠI",
                  backgroundColor: AppColors.primaryColor,
                  textStyle: CustomTextStyle.t8(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
