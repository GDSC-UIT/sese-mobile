import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';

class SettingsScreen extends StatelessWidget {
  UserProfileController userProfileController = Get.find();
  SettingsScreen({Key? key}) : super(key: key);

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
        title:
            Text("Settings", style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(children: [
          InkWell(
            onTap: () {},
            child: InkWell(
              onTap: () {},
              child: InPutTextField(
                  hintText: "My address",
                  textStyle: CustomTextStyle.t4(AppColors.darkGreyColor),
                  isEnable: false,
                  controller: userProfileController.userAddress.value),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {},
            child: Container(
                height: 57,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greenColor,
                    width: 1.2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Language",
                      style: CustomTextStyle.t4(AppColors.darkGreyColor),
                    ),
                    Text(
                      userProfileController.listLanguage[0]["language"],
                      style: CustomTextStyle.t4(AppColors.lightGreyColor),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 16,
          ),
          AppButton(
            onPress: () {},
            text: "LOGOUT",
            textStyle: CustomTextStyle.t8(Colors.white),
            backgroundColor: AppColors.primaryColor,
          ),
        ]),
      ),
    );
  }
}
