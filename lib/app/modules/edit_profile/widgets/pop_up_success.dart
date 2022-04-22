import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_user_profile_screen.dart';

Widget PopUp(BuildContext context) {
  return AlertDialog(
    title: Text(
      'Cảm ơn!',
      style: CustomTextStyle.h2(AppColors.darkGreyColor),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Thông tin của bạn đã được cập nhật.",
          style: TextStyle(color: AppColors.darkGreyColor, fontSize: 16),
        ),
      ],
    ),
    actions: <Widget>[
      Container(
        padding: const EdgeInsets.only(right: 100, left: 16),
        child: AppButton(
          backgroundColor: AppColors.primaryColor,
          onPress: () {
            Navigator.of(context).pop();
          },
          text: "Tiếp tục",
          textStyle: CustomTextStyle.t8(Colors.white),
        ),
      )
    ],
  );
}
