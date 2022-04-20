import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/routes/app_routes.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_constant.dart';
import '../../../global_widgets/app_button.dart';
import '../verify_controller.dart';
import '../widgets/dialog_success.dart';
import '../widgets/image_verify.dart';

class VerifyBackSvSuccessScreen extends StatelessWidget {
  VerifyController verifyController = Get.find();

  VerifyBackSvSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //show dialog success
    Get.dialog(DialogSuccess());
    Future.delayed(const Duration(seconds: 2), () => Get.back());

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
                  "Take a photo of the back of your ${verifyController.typeCard}",
                  style: CustomTextStyle.t4(Colors.black),
                ),
                const SizedBox(
                  height: 29,
                ),
                Obx(() => ImageVerify(verifyController.image)),
                const SizedBox(
                  height: 75,
                ),
                InkWell(
                  onTap: () {
                    verifyController.pickBackImage(ImageSource.camera);
                  },
                  child: Text(
                    "Recapture",
                    style: GoogleFonts.robotoMono(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greenColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                AppButton(
                  onPress: () async {
                    await verifyController.getTypeCard();
                    Get.toNamed(AppRoutes.verifySuccess);
                  },
                  text: "NEXT",
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
