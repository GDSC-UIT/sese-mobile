import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class InPutTextField extends StatelessWidget {
  const InPutTextField(
      {Key? key,
      required this.hintText,
      required this.isEnable,
      required this.controller,
      this.typeKeyBoard,
      this.suffixIcon,
      this.prefixicon,
      this.textStyle,
      this.onChange,
      this.maxLine,
      this.onSubmit})
      : super(key: key);
  final String hintText;
  final Function? onSubmit;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final TextEditingController controller;
  final bool isEnable;
  final TextStyle? textStyle;
  final Function? onChange;
  final int? maxLine;
  final TextInputType? typeKeyBoard;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        onSubmit == null ? () {} : onSubmit!();
      },
      maxLines: maxLine ?? 1,
      controller: controller,
      enabled: isEnable,
      style: textStyle,
      keyboardType: typeKeyBoard,
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
