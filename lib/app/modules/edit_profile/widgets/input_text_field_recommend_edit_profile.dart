import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';

class InPutTextFieldRecommendEditProfile extends StatelessWidget {
  InPutTextFieldRecommendEditProfile({
    Key? key,
    required this.hintText,
    required this.controller,
    this.textStyle,
    this.onChange,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextStyle? textStyle;
  final Function? onChange;
  final EditProfileController editProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange != null
          ? (value) {
              editProfileController.searchKey.value = value;
              onChange!();
            }
          : (value) {},
      controller: controller,
      autofocus: true,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintStyle: textStyle,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGreenColor,
            width: 1.5,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGreenColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
