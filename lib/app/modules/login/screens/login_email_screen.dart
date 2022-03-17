import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/modules/login/login_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../global_widgets/app_button.dart';
import '../../../global_widgets/input_text_field.dart';

class LoginEmailScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: _screenHeight * 0.05,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.backIcon,
                  size: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(
                  "Đây là email của mình",
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.028,
              ),
              InPutTextField(
                hintText: 'Điền địa chỉ email của bạn',
                isEnable: true,
                controller: loginController.nameInputController.value,
              ),
              SizedBox(
                height: _screenHeight * 0.076,
              ),
              AppButton(
                onPress: () {},
                text: "TIẾP TỤC NHA",
                textStyle: CustomTextStyle.t8(Colors.white),
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
