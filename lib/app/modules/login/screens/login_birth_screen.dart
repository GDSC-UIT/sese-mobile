import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

// ignore: must_be_immutable
class LoginBirthScreen extends StatelessWidget {
  LoginBirthScreen({Key? key}) : super(key: key);

  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'My birthday is',
              style: CustomTextStyle.h1(AppColors.primaryColor),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                loginController.datePicker(context);
              },
              child: InPutTextField(
                controller: loginController.dateInputController.value,
                isEnable: false,
                hintText: 'DD/MM/YY',
                textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                suffixIcon: Image.asset('assets/images/Calendar_icon.png'),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            AppButton(
              onPress: () {
                if (loginController.dateInputController.value.value.text !=
                    '') {
                  Get.toNamed(AppRoutes.authUni);
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
