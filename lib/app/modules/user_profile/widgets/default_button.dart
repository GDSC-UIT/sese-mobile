import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.primaryColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Center(
          child: Text(
        "Default",
        style: CustomTextStyle.t4(AppColors.primaryColor),
      )),
    );
  }
}
