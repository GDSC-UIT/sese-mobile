import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sese/app/core/themes/app_theme.dart';

import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

// ignore: must_be_immutable
class LoginEmailScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 30,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                  "Đây là email của mình",
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.028,
              ),
              InPutTextField(
                textStyle: CustomTextStyle.t8(AppColors.neutralGrey),
                hintText: 'Điền địa chỉ email của bạn',
                isEnable: true,
                controller: loginController.emailInputController.value,
              ),
              SizedBox(
                height: _screenHeight * 0.076,
              ),
              AppButton(
                onPress: () {
                  Get.toNamed(AppRoutes.authVerifyBegin);
                },
                text: 'TIẾP TỤC NHA',
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
