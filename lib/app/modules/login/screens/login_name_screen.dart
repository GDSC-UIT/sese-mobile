import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

// ignore: must_be_immutable
class LoginNameScreen extends StatelessWidget {
  LoginNameScreen({Key? key}) : super(key: key);
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'My name is',
              style: CustomTextStyle.h1(AppColors.primaryColor),
            ),
            const SizedBox(
              height: 16,
            ),
            InPutTextField(
              textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
              hintText: 'Fill your name here',
              isEnable: true,
              controller: loginController.nameInputController.value,
            ),
            const SizedBox(
              height: 64,
            ),
            AppButton(
              onPress: () {
                if (loginController.nameInputController.value.value.text !=
                    '') {
                  Get.toNamed(AppRoutes.authBirth);
                } else {
                  Get.snackbar('', 'Please fill all  the field!');
                }
              },
              text: 'NEXT',
              textStyle: CustomTextStyle.t8(Colors.white),
              backgroundColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
