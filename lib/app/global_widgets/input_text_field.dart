import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class InPutTextField extends StatelessWidget {
  InPutTextField({
    Key? key,
    required this.hintText,
    required this.isEnable,
    required this.controller,
    this.suffixIcon,
    this.textStyle,
    this.onChange,
  }) : super(key: key);
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool isEnable;
  final TextStyle? textStyle;
  final Function? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: isEnable,
      autofocus: isEnable,
      style: 
      const TextStyle(
        color: AppColors.darkGreyColor, 
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
        hintStyle: textStyle,
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
