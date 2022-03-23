import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/edit_profile/widgets/header_text.dart';
import 'package:sese/app/modules/edit_profile/widgets/input_text_field_recommend_edit_profile.dart';
import 'package:sese/app/modules/login/widgets/input_text_field_recommend_login.dart';
import 'package:sese/app/routes/app_routes.dart';

class EditUniversity extends StatelessWidget {
  EditProfileController editProfileController = Get.find();
  EditUniversity({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
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
                              margin: const EdgeInsets.symmetric(vertical: 2),
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
          ],
        ),
      ),
    );
  }
}
/* 
*/