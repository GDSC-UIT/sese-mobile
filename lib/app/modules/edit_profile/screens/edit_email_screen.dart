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
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/edit_profile/widgets/header_text.dart';
import 'package:sese/app/modules/edit_profile/widgets/pop_up_success.dart';
import 'package:sese/app/routes/app_routes.dart';

class EditEmailScreen extends StatelessWidget {
  EditProfileController editProfileController = Get.find();
  EditEmailScreen({Key? key}) : super(key: key);

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
        title: Text("Email", style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(text: "Email"),
                    Obx(
                      () => InPutTextField(
                        hintText: "abc@gmail.com",
                        isEnable: true,
                        suffixIcon: TextButton(
                          onPressed: () {},
                          child: const Icon(Icons.close),
                        ),
                        controller:
                            editProfileController.emailInputController.value,
                      ),
                    ),
                    const SizedBox(
                      height: AppConstant.gapInputAppButton,
                    ),
                    AppButton(
                      onPress: () async {
                        HttpService.showLoadingIndecator();
                        var newEmailUser = {
                          "email": editProfileController
                              .emailInputController.value.text
                        };
                        print(newEmailUser); 
                        var response = await HttpService.putRequest(
                          body: jsonEncode(newEmailUser),
                          url: UrlValue.appUrlUpdateUserProfile,
                        );

                        DataCenter.user["email"] =
                            jsonDecode(response.body)["user"]["email"];

                        editProfileController.email.value =
                            DataCenter.user["email"];

                        print(response.body);
                        Get.back();

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
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return PopUp(context);
}
