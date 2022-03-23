import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class InPutTextField extends StatelessWidget {
  InPutTextField(
      {Key? key,
      required this.hintText,
      required this.isEnable,
      required this.controller,
      this.suffixIcon,
      this.prefixicon,
      this.textStyle,
      this.onChange,
      this.maxLine})
      : super(key: key);
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final TextEditingController controller;
  final bool isEnable;
  final TextStyle? textStyle;
  final Function? onChange;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine ?? 1,
      controller: controller,
      enabled: isEnable,
      autofocus: isEnable,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        suffixIcon: suffixIcon,
        prefixIcon: prefixicon,
        hintText: hintText,
        hintStyle: textStyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGreen,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
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
