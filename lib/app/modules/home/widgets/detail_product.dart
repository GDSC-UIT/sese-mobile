import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                "Product Details",
                style: CustomTextStyle.h4(Colors.black),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: AppColors.cloadDarkColor,
        ),
        SizedBox(
          height: 105,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: CustomTextStyle.t8(AppColors.lightGrey),
                      ),
                      Text(
                        "Size",
                        style: CustomTextStyle.t8(AppColors.lightGrey),
                      ),
                      Text(
                        "Condition",
                        style: CustomTextStyle.t8(AppColors.lightGrey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "KTX khu A, ĐHQG Tp Hồ Chí Minh",
                        style: CustomTextStyle.t8(Colors.black),
                      ),
                      Text(
                        "26.5 cm",
                        style: CustomTextStyle.t8(Colors.black),
                      ),
                      Text(
                        "90%",
                        style: CustomTextStyle.t8(Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: _screenHeight * (109 / 844),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.lightGreyColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid phát covid ",
                style: CustomTextStyle.t6(AppColors.darkGreyColor),
              ),
            ),
          ),
        ),
        Container(
          height: 4,
          color: AppColors.cloadDarkColor,
        ),
        SizedBox(
          height: 37,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Xem thêm",
                style: CustomTextStyle.t8(AppColors.primaryColor),
              ),
              const SizedBox(
                width: 9,
              ),
              Transform.rotate(
                angle: -90 * pi / 180,
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        )
      ],
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
