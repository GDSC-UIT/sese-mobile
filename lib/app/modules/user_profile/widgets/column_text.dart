import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class ColumnText extends StatelessWidget {
  final String label;
  final String number;
  const ColumnText({Key? key, required this.label, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Text(
        number,
        style: CustomTextStyle.t3(AppColors.primaryColor),
      ),
      Text(
        label,
        style: CustomTextStyle.t6(AppColors.darkGreyColor),
      )
    ]));
  }
}
