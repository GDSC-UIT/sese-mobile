import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class InfoLabel extends StatelessWidget {
  const InfoLabel({Key? key, required this.isRequired, required this.text})
      : super(key: key);
  final bool isRequired;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: CustomTextStyle.t2(AppColors.darkGreyColor),
        children: <TextSpan>[
          TextSpan(
            text: isRequired == true ? ' *' : '',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
