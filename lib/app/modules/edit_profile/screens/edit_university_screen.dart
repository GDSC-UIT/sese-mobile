import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_constant.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/edit_profile/widgets/header_text.dart';
import 'package:sese/app/modules/edit_profile/widgets/input_text_field_recommend_edit_profile.dart';

class EditUniversityScreen extends StatelessWidget {
  final EditProfileController editProfileController = Get.find();
  EditUniversityScreen({Key? key}) : super(key: key);

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
            Text("Đại học", style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(text: "Đại học"),
            InPutTextFieldRecommendEditProfile(
              hintText: 'Nhập tên trường',
              controller: editProfileController.schoolInputController.value,
              onChange: editProfileController.searchSchool,
              textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
            ),
            const SizedBox(height: 16),
            Obx(
              () => editProfileController.recommendUniName.isEmpty
                  ? const SizedBox()
                  : Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              editProfileController
                                      .schoolInputController.value.text =
                                  editProfileController.recommendUniName[index];
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                editProfileController.recommendUniName[index],
                                style: CustomTextStyle.t8(Colors.white),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          );
                        },
                        itemCount:
                            editProfileController.recommendUniName.length > 5
                                ? 5
                                : editProfileController.recommendUniName.length,
                      ),
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
          ],
        ),
      ),
    );
  }
}
/* 
*/