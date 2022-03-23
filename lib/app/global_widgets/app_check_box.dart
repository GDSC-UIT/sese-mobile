import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class CheckBox extends StatelessWidget {
  const CheckBox(
      {Key? key,
      required this.genderValue,
      required this.onPress,
      required this.isSelected})
      : super(key: key);

  final String genderValue;
  final Function onPress;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          genderValue,
          style: CustomTextStyle.t6(AppColors.darkGreyColor),
        ),
        InkWell(
          onTap: () {
            onPress();
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: isSelected
                ? const Center(
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.white,
                    ),
                  )
                : const Center(
                    child: Icon(
                      Icons.circle,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
          ),
        )
      ]),
    );
  }
}
