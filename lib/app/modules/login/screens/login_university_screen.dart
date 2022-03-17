import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
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
              'Mình học tại',
              style: CustomTextStyle.h1(AppColors.primaryColor),
            ),
            const SizedBox(
              height: 16,
            ),
            InPutTextField(
              onChange: loginController.searchSchool,
              hintText: 'Nhập tên trường',
              isEnable: true,
              textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
              controller: loginController.schoolInputController.value,
            ),
            Obx(
              () => loginController.recommendUniName.isEmpty
                  ? const SizedBox()
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          print(
                              'list school recommend:${loginController.recommendUniName}');
                          return Container(
                            child:
                                Text(loginController.recommendUniName[index]),
                          );
                        },
                        itemCount: loginController.recommendUniName.length > 5
                            ? 5
                            : loginController.recommendUniName.length,
                      ),
                    ),
            ),
            const SizedBox(
              height: 64,
            ),
            AppButton(
              onPress: () {
                Get.toNamed(AppRoutes.authInterest);
              },
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
