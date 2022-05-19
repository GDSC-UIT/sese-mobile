import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_constant.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/global_widgets/app_check_box.dart';
import 'package:sese/app/modules/edit_profile/widgets/pop_up_success.dart';

class EditGenderScreen extends StatelessWidget {
  EditProfileController editProfileController = Get.find();
  EditGenderScreen({Key? key}) : super(key: key);

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
            () => AppCheckBox(
              textOptionString: "Nam",
              onPress: () {
                editProfileController.isMale.value = true;
              },
              isSelected: editProfileController.isMale.value,
            ),
          ),
          Obx(
            () => AppCheckBox(
              textOptionString: "Nữ",
              onPress: () {
                editProfileController.isMale.value = false;
              },
              isSelected: !editProfileController.isMale.value,
            ),
          ),

          const SizedBox(
            height: AppConstant.gapInputAppButton,
          ),
          AppButton(
            onPress: () async {
              HttpService.showLoadingIndecator();
              //update gender
              editProfileController.updateGender();
              var newGenderUser = {
                "gender": editProfileController.gender.value,
              };
              print(editProfileController.isMale.value);
              var response = await HttpService.putRequest(
                body: jsonEncode(newGenderUser),
                url: UrlValue.appUrlUpdateUserProfile,
              );
              print("response:${response.body}");

              DataCenter.user["gender"] =
                  jsonDecode(response.body)["user"]["gender"];

              editProfileController.gender.value = DataCenter.user["gender"];

              //print(response.body);
              Get.back();
              Get.back();

              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
            text: "LƯU THAY ĐỔI",
            textStyle: CustomTextStyle.t8(Colors.white),
            backgroundColor: AppColors.primaryColor,
          ),
        ]),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return PopUp(context);
}
