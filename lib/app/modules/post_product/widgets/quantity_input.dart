import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class QuantityInput extends StatelessWidget {
  const QuantityInput({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: false,
      style: CustomTextStyle.t2(AppColors.darkGreyColor),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
        prefixIcon: Image.asset(
          'assets/icons/Shopping_Bag_01.png',
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.cloadDarkColor,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Text(
                  '+',
                  style: CustomTextStyle.t8(AppColors.darkGreyColor),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text('1'),
            const SizedBox(
              width: 16,
            ),
            InkWell(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.cloadDarkColor,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                margin: const EdgeInsets.only(right: 12),
                child: Text(
                  '-',
                  style: CustomTextStyle.t8(AppColors.darkGreyColor),
                ),
              ),
            )
          ],
        ),
        // prefixIcon: prefixicon,
        hintText: 'Số lượng',
        hintStyle: CustomTextStyle.t2(AppColors.darkGreyColor),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greenColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
