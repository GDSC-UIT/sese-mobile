import 'package:flutter/material.dart';
import 'package:sese/app/core/values/assets.gen.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          TextIcon(Icons.access_time, "1 hour ago", 3,
              CustomTextStyle.t10(AppColors.neutralGrey)),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: AppColors.neutralGrey,
                  size: 15,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "in",
                        style: CustomTextStyle.t10(AppColors.neutralGrey),
                      ),
                      TextSpan(
                        text: " Fashion",
                        style: CustomTextStyle.t10(AppColors.backIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 5,
          ),
          TextIcon(Icons.location_on_outlined, "TP HỒ CHÍ MINH", 3,
              CustomTextStyle.t10(AppColors.neutralGrey)),
        ],
      ),
    );
  }
}

Widget TextIcon(IconData icon, String text, int flex, TextStyle textStyle) {
  return Expanded(
    flex: flex,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: AppColors.neutralGrey,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ),
      ],
    ),
  );
}
