import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';

class LanguageScreen extends StatelessWidget {
  UserProfileController userProfileController = Get.find();
  LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Done",
                style: CustomTextStyle.h4(AppColors.greenColor),
              ))
        ],
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
        title: Text("Choose Language",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(children: [
          Obx(
            () => InkWell(
              onTap: () {
                userProfileController.english.value = true;
              },
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "English",
                        style: CustomTextStyle.t4(AppColors.darkGreyColor),
                      ),
                      userProfileController.english.value
                          ? const Icon(
                              Icons.check,
                              color: AppColors.primaryColor,
                            )
                          : Container()
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Obx(
            () => InkWell(
              onTap: () {
                userProfileController.english.value = false; 
              },
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Việt Nam",
                        style: CustomTextStyle.t4(AppColors.darkGreyColor),
                      ),
                      userProfileController.english.value==false
                          ? const Icon(
                              Icons.check,
                              color: AppColors.primaryColor,
                            )
                          : Container()
                    ],
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
