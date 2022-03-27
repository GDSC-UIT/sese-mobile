import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';

class NewAddressScreen extends StatelessWidget {
  UserProfileController userProfileController = Get.find();
  NewAddressScreen({Key? key}) : super(key: key);

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
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("New Address",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Text(
            "Name",
            style: CustomTextStyle.t4(AppColors.neutralGrey),
          ),
          InPutTextField(
              hintText: "Nguyen Meo Meo",
              isEnable: true,
              controller: userProfileController.userName.value),
          Text(
            "Name",
            style: CustomTextStyle.t4(AppColors.neutralGrey),
          ),
        ]),
      ),
    );
  }
}
