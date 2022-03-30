import 'package:flutter/material.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/assets.gen.dart';
import '../../../global_widgets/app_button.dart';

class InfoSeller extends StatelessWidget {
  const InfoSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            image: const DecorationImage(
                              image: Assets.imagesAvatar,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "meow meow",
                          style: CustomTextStyle.t4(Colors.black),
                        ),
                        Text(
                          "Online 1 giờ trước",
                          style: CustomTextStyle.t10(AppColors.neutralGrey),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "10",
                          style: CustomTextStyle.t9(AppColors.primaryColor),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sản phẩm",
                          style: CustomTextStyle.t10(Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "2",
                          style: CustomTextStyle.t9(AppColors.primaryColor),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "following",
                          style: CustomTextStyle.t10(Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton(
                onPress: () {},
                text: "Xem người bán",
                textStyle: CustomTextStyle.t3(AppColors.primaryColor),
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
