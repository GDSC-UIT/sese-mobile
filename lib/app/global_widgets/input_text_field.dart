import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/values/app_colors.dart';

class InPutTextField extends StatelessWidget {
  const InPutTextField({
    Key? key,
    required this.hintText,
    required this.isEnable,
    required this.controller,
    this.suffixIcon,
  }) : super(key: key);
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool isEnable;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: isEnable,
      autofocus: isEnable,
      style: const TextStyle(
        fontSize: 24,
        color: AppColors.lightTextColor,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        hintStyle: const TextStyle(
          fontSize: 18,
          color: AppColors.lightGreyColor,
        ),
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
