import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/global_widgets/app_button.dart';

import '../../../core/values/app_colors.dart';

class LoginPhoneScreen extends StatefulWidget {
  const LoginPhoneScreen({Key? key}) : super(key: key);

  @override
  State<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              SizedBox(
                height: _screenHeight * 0.03,
              ),
              Text(
                "Số điện thoại của mình là",
                style: CustomTextStyle.h1(
                  AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.028,
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {},
                onInputValidated: (bool value) {},
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: CustomTextStyle.t6(AppColors.greenColor),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                hintText: "Điền số điện thoại của bạn",
                textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
              ),
              const SizedBox(
                height: 100,
              ),
              AppButton(
                onPress: () {},
                text: "TIẾP TỤC NHA",
                textColor: Colors.white,
                backgroundColor: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
