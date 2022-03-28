import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class AdjustQuantityButton extends StatelessWidget {
  const AdjustQuantityButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.cloadDarkColor,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Text(
        text,
        style: CustomTextStyle.t8(AppColors.darkGreyColor),
      ),
    );
  }
}
