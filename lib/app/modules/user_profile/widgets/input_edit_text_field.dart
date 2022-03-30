import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';

class InPutEditTextField extends StatelessWidget {
  InPutEditTextField({
    Key? key,
    required this.controller,
    required this.isEnable,
    this.suffixIcon,
    this.textStyle,
    this.onChange,
  }) : super(key: key);
  final Widget? suffixIcon;
  final UserProfileController userProfileController = Get.find();
  final bool isEnable;
  final TextStyle? textStyle;
  final Function? onChange;
  final TextEditingController controller; 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: controller.text,
      enabled: isEnable,
      autofocus: isEnable,
      style: CustomTextStyle.t4(AppColors.darkGreyColor),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.greenColor)),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greenColor,
            width: 1.5,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greenColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
