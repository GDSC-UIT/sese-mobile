import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_constant.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/edit_profile/widgets/header_text.dart';
import 'package:sese/app/modules/edit_profile/widgets/pop_up_success.dart';

class EditNameScreen extends StatelessWidget {
  EditNameScreen({Key? key}) : super(key: key);
  EditProfileController editProfileController = Get.find();
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
        title:
            Text("Họ tên", style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HeaderText(text: "Họ tên"),
              Obx(
                () => InPutTextField(
                  hintText: "abc xyz",
                  isEnable: true,
                  suffixIcon: TextButton(
                    onPressed: () {
                      editProfileController.nameInputController.value =
                          TextEditingController(text: "");
                    },
                    child: const Icon(Icons.close),
                  ),
                  controller: editProfileController.nameInputController.value,
                ),
              ),
              const SizedBox(
                height: AppConstant.gapInputAppButton,
              ),
              AppButton(
                onPress: () async {
                  HttpService.showLoadingIndecator();
                  var nameUser = {
                    "name": editProfileController.nameInputController.value.text
                  };
                  var response = await HttpService.putRequest(
                    body: jsonEncode(nameUser),
                    url: UrlValue.appUrlUpdateUserProfile,
                  );
                  print(response.body);
                  Get.back();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
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

Widget _buildPopupDialog(BuildContext context) {
  return PopUp(context);
}
