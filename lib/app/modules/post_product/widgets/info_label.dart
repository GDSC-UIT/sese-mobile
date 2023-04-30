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
    var textSpan = (text.length > 32) ? '${text.substring(0, 30)}...' : text;
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: textSpan,
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
