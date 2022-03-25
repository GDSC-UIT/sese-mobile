import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class ColumnText extends StatelessWidget {
  final String lable;
  final String number;
  const ColumnText({Key? key, required this.lable, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Text(
        lable,
        style: CustomTextStyle.t3(AppColors.primaryColor),
      ),
      Text(
        "Folowers",
        style: CustomTextStyle.t6(AppColors.darkGreyColor),
      )
    ]));
  }
}
