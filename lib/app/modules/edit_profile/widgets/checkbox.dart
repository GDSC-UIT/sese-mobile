import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';

Widget GenderCheckbox( int index) {
  EditProfileController editProfileController = Get.find();
  return Obx(()=>
     Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          editProfileController.listGender[index]["gender"],
          style: CustomTextStyle.t6(AppColors.darkGreyColor),
        ),
        InkWell(
          onTap: () {
            editProfileController.toggleSelectedGender(index);
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: editProfileController.listGender[index]["isSelected"]
                ? const Center(
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.white,
                    ),
                  )
                : const Center(
                    child: Icon(
                      Icons.circle,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
          ),
        )
      ]),
    ),
  );
}
