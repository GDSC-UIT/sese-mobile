import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

import '../../../core/values/app_colors.dart';

class LoginPhoneScreen extends StatelessWidget {
  final String initialCountry = 'VNM';
  final PhoneNumber number = PhoneNumber(isoCode: 'VN');
  final LoginController loginController = Get.find();

  LoginPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                "My phone number is",
                style: CustomTextStyle.h1(
                  AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.028,
              ),
              InternationalPhoneNumberInput(
                locale: 'Vietnam',
                onInputChanged: (PhoneNumber number) {},
                onInputValidated: (bool value) {},
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                selectorTextStyle: CustomTextStyle.t6(AppColors.greenColor),
                initialValue: number,
                textFieldController: loginController.phoneInputController.value,
                formatInput: false,
                hintText: "Fill your number here",
                textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
              ),
              const SizedBox(
                height: 100,
              ),
              AppButton(
                onPress: () {
                  Get.toNamed(AppRoutes.authEmail);
                  if (loginController.phoneInputController.value.value.text !=
                      '') {
                    Get.toNamed(AppRoutes.authEmail);
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
      ),
    );
  }
}
