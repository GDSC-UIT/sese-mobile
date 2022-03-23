import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_constant.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/global_widgets/app_check_box.dart';
import 'package:sese/app/routes/app_routes.dart';

class EditGender extends StatelessWidget {
  EditProfileController editProfileController = Get.find();
  EditGender({Key? key}) : super(key: key);

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
        title: Text("Giới tính",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
        child: Column(children: [
          // GenderCheckbox(0),
          // GenderCheckbox(1),
          // GenderCheckbox(2),
          Obx(
            () => CheckBox(
              genderValue: editProfileController.listGender[0]["gender"],
              onPress: () {
                editProfileController.toggleSelectedGender(0);
              },
              isSelected: editProfileController.listGender[0]["isSelected"],
            ),
          ),
          Obx(
            () => CheckBox(
              genderValue: editProfileController.listGender[1]["gender"],
              onPress: () {
                editProfileController.toggleSelectedGender(1);
              },
              isSelected: editProfileController.listGender[1]["isSelected"],
            ),
          ),

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
      ),
    );
  }
}
