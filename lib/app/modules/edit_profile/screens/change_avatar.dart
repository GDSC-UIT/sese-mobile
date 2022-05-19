import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../data/services/http_service.dart';
import '../../../global_widgets/app_button.dart';
import '../edit_profile_controller.dart';

class ChangeAvatarScreen extends StatelessWidget {
  ChangeAvatarScreen({Key? key}) : super(key: key);
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
            Text("Avatar", style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 17,
            ),
            AppButton(
              onPress: () {},
              text: "CAPTURE",
              textStyle: CustomTextStyle.t8(AppColors.primaryColor),
              backgroundColor: AppColors.lightOrange,
              borderColor: AppColors.primaryColor,
              borderThickness: 1,
            ),
            const SizedBox(
              height: 17,
            ),
            AppButton(
              onPress: () async {
                await editProfileController
                    .pickAvatarFromGallery(ImageSource.gallery);
                await editProfileController.addAvatar();
              },
              text: "CHOOSE FROM LIBRARY",
              textStyle: CustomTextStyle.t8(AppColors.primaryColor),
              backgroundColor: AppColors.lightOrange,
              borderColor: AppColors.primaryColor,
              borderThickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
