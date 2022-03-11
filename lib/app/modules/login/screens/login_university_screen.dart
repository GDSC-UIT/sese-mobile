import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

// ignore: must_be_immutable
class LoginUniversityScreen extends StatelessWidget {
  LoginUniversityScreen({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Mình học tại',
              style: TextStyle(
                fontSize: 32,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InPutTextField(
              hintText: 'Nhập tên trường',
              isEnable: true,
              controller: loginController.schoolInputController.value,
            ),
            const SizedBox(
              height: 64,
            ),
            AppButton(
              onPress: () {
                Get.toNamed(AppRoutes.authBirth);
              },
              text: 'TIẾP TỤC NHA',
              textColor: Colors.white,
              backgroundColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
