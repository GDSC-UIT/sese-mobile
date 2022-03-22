import 'package:flutter/material.dart';

import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

import 'package:sese/app/global_widgets/app_button.dart';

class ChangeLinkAccount extends StatelessWidget {
  const ChangeLinkAccount({Key? key}) : super(key: key);

  get loginController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text("Tài khoản liên kết",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        height: 158,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: AppButton(
              textStyle: CustomTextStyle.t8(AppColors.darkGreyColor),
              onPress: () {},
              text: 'LOGIN WITH GOOGLE',

              // textColor: AppColors.darkGreyColor,
              borderColor: AppColors.greenColor,
              icon: Image.asset(
                'assets/images/google_icon.png',
                scale: 0.5,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: AppButton(
              textStyle: CustomTextStyle.t8(AppColors.darkGreyColor),
              onPress: () {},
              text: 'LOGIN WITH FACEBOOK',
              // textColor: AppColors.darkGreyColor,
              borderColor: AppColors.greenColor,
              icon: Image.asset(
                'assets/images/facebook_icon.png',
                scale: 0.5,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
