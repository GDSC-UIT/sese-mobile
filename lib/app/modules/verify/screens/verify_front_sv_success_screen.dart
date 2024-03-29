import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/verify/verify_controller.dart';
import 'package:sese/app/modules/verify/widgets/dialog_success.dart';
import 'package:sese/app/routes/app_routes.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_constant.dart';
import '../widgets/image_verify.dart';

class VerifyFrontSvSuccessScreen extends StatelessWidget {
  final VerifyController verifyController = Get.find();

  VerifyFrontSvSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showMessage() {
      showDialog(
        context: context,
        builder: (_) => const DialogSuccess(),
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
                  height: 29,
                ),
                Obx(() => imageVerify(verifyController.image)),
                const SizedBox(
                  height: 75,
                ),
                InkWell(
                  onTap: () {
                    verifyController.pickFrontImage(ImageSource.camera);
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
                  onPress: () {
                    Get.toNamed(AppRoutes.verifyBackSv);
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
