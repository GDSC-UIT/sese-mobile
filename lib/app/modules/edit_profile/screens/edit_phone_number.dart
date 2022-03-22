import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/edit_profile/widgets/header_text.dart';

class EditPhoneNumber extends StatefulWidget {
  const EditPhoneNumber({Key? key}) : super(key: key);

  @override
  State<EditPhoneNumber> createState() => _EditPhoneNumberState();
}

class _EditPhoneNumberState extends State<EditPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    PhoneNumber number = PhoneNumber(isoCode: 'VN');
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text("Số điện thoại",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HeaderText(text: "Nhập số điện thoại mới của bạn"),
          InternationalPhoneNumberInput(
            locale: 'Vietnam',
            onInputChanged: (PhoneNumber number) {},
            onInputValidated: (bool value) {},
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            selectorTextStyle: CustomTextStyle.t6(AppColors.greenColor),
            initialValue: number,
            textFieldController: controller,
            formatInput: false,
            hintText: "Điền số điện thoại của bạn",
            textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green, width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ]),
      ),
    );
  }
}
