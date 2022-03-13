import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:intl/intl.dart';
import 'package:sese/app/modules/login/login_controller.dart';

class LoginBirthScreen extends StatelessWidget {
  LoginBirthScreen({Key? key}) : super(key: key);

  LoginController loginController = Get.find();

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
            Text(
              'Mình sinh ngày',
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
                hintText: 'Ngày/Tháng/Năm',
                textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                suffixIcon: Image.asset('assets/images/Calendar_icon.png'),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            AppButton(
              onPress: () {},
              text: 'TIẾP TỤC NHA',
              textStyle: CustomTextStyle.t8(Colors.white),
              backgroundColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
