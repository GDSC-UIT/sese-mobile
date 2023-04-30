import 'package:flutter/material.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../global_widgets/app_button.dart';

class InfoSeller extends StatelessWidget {
  const InfoSeller({Key? key, this.product}) : super(key: key);
  final dynamic product;
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
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            image: DecorationImage(
                              image: Image.network(product['user']['avatar'])
                                  .image,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          product["user"]["name"],
                          style: CustomTextStyle.t4(Colors.black),
                        ),
                        Text(
                          "Online 1m ago",
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
                          "3",
                          style: CustomTextStyle.t9(AppColors.primaryColor),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Post(s)",
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
                text: "View Profile",
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
