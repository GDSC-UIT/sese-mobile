/* import 'package:flutter/material.dart';

import 'package:sese/app/core/values/app_colors.dart';

class InputEditText extends StatelessWidget {
  InputEditText({
    Key? key,
    required this.text,
    required this.isEnable,
    this.suffixIcon,
    this.textStyle,
    this.onChange,
  }) : super(key: key);
  final String text;
  final Widget? suffixIcon;
  final bool isEnable;
  final TextStyle? textStyle;
  final Function? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChange!();
      },
      enabled: isEnable,
      autofocus: isEnable,
      style: textStyle,
      initialValue: text,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
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
            color: AppColors.backIcon,
            width: 1.5,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.backIcon,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
 */
