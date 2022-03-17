import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/global_widgets/app_button.dart';

import '../../../core/values/app_colors.dart';

class LoginVerifyBeginScreen extends StatelessWidget {
  const LoginVerifyBeginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.backIcon,
              size: 30,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(
                  "Hãy xác thực tài khoản với Se Sẻ nha",
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                ),
                child: Text(
                  "Mình muốn xác thực bằng:",
                  style: CustomTextStyle.t8(Colors.black),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.032,
              ),
              AppButton(
                  onPress: () {},
                  text: "THẺ SINH VIÊN",
                  //  textColor: AppColors.primaryColor,
                  backgroundColor: AppColors.lightOrange,
                  borderColor: AppColors.primaryColor,
                  textStyle: CustomTextStyle.t8(AppColors.primaryColor)),
              SizedBox(
                height: _screenHeight * 0.032,
              ),
              AppButton(
                onPress: () {},
                text: "CMND/CCCD",
                textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
              ),
              SizedBox(
                height: _screenHeight * 0.076,
              ),
              const Center(
                child: Text(
                  "Mình sẽ xác thực sau nha",
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.greenColor,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
