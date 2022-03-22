import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_constant.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/edit_profile/widgets/header_text.dart';


class EditEmail extends StatelessWidget {
  EditProfileController editProfileController = Get.find();
  EditEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text("Email", style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HeaderText(text: "Email"),
              // InPutTextField(
              //   hintText: "Tên cũ nè",
              //   isEnable: true,
              //   suffixIcon: TextButton(
              //     onPressed: () {},
              //     child: const Icon(Icons.close),
              //   ),
              //   controller: editProfileController.nameInputController.value,
              // ),
              const SizedBox(
                height: AppConstant.gapInputAppButton,
              ),
              AppButton(
                onPress: () {},
                text: "LƯU THAY ĐỔI",
                textStyle: CustomTextStyle.t8(Colors.white),
                backgroundColor: AppColors.primaryColor,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
