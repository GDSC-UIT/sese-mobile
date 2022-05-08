import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class Content extends StatelessWidget {
  Content({
    required this.imagePath,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  String imagePath;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            title,
            style: CustomTextStyle.h1(AppColors.primaryColor),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            width: 286.0,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: CustomTextStyle.t4(AppColors.neutralGrey),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
