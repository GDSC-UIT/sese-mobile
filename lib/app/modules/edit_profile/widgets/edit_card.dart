import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class EditCard extends StatelessWidget {
  final String lable;
  final String userInfo;
  const EditCard({Key? key, required this.lable, required this.userInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.backIcon,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      height: 48,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                lable,
                style: CustomTextStyle.t6(AppColors.darkGreyColor),
              )),
          Expanded(
            flex: 4,
            child: Text(userInfo,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.t6(AppColors.darkGreyColor)),
          ),
          SizedBox(
            width: 40,
            child: TextButton(
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.backIcon,
                size: 14,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}