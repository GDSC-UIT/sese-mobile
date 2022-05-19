import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';
import 'package:sese/app/modules/edit_profile/widgets/edit_card.dart';
import 'package:sese/app/routes/app_routes.dart';
import 'package:sese/app/modules/edit_profile/widgets/pop_up_success.dart';

class EditUserProfileScreen extends StatelessWidget {
  EditUserProfileScreen({Key? key}) : super(key: key);
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
        title: Text("Thông tin cá nhân",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 47),
              child: Container(
                child: Center(
                  child: Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      overflow: Overflow.visible,
                      children: [
                        SizedBox(
                          width: 96,
                          height: 96,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(FirebaseAuth
                                    .instance.currentUser!.photoURL ??
                                "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200&d=mm&r=g"),
                            radius: 50,
                          ),
                        ),
                        Positioned(
                          child: InkWell(
                            child: const CircleAvatar(
                              radius: 13,
                              backgroundColor: AppColors.backIcon,
                              child: Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            onTap: () {
                              Get.toNamed(AppRoutes.editAvatar);
                            },
                          ),
                          bottom: -8,
                          right: 0,
                        )
                      ]),
                ),
              ),
            ),
            Obx(
              () => EditCard(
                label: "Tên",
                userInfo: editProfileController.name.value,
                toPage: AppRoutes.editName,
              ),
            ),
            Obx(
              () => EditCard(
                label: "Ngày sinh",
                userInfo: editProfileController.birthDate.value,
                toPage: AppRoutes.editDateOfBirth,
              ),
            ),
            Obx(
              () => EditCard(
                label: "Giới tính",
                userInfo: editProfileController.gender.value,
                toPage: AppRoutes.editGender,
              ),
            ),
            Obx(
              () => EditCard(
                label: "Đại học",
                userInfo: editProfileController.university.value,
                toPage: AppRoutes.editUniversity,
              ),
            ),
            Obx(
              () => EditCard(
                  label: "Phone",
                  userInfo: editProfileController.phoneNumber.value,
                  toPage: AppRoutes.editPhoneNumber),
            ),
            Obx(
              () => EditCard(
                  label: "Email",
                  userInfo: editProfileController.email.value,
                  toPage: AppRoutes.editEmail),
            ),
            const EditCard(
              label: "Tài khoản liên kết",
              userInfo: "",
              toPage: AppRoutes.editLinkAccount,
            ),
          ],
        ),
      ),
    );
  }
}
