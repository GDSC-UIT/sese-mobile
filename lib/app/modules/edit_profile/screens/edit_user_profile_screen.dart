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
                        const SizedBox(
                          width: 96,
                          height: 96,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
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
                            onTap: () {},
                          ),
                          bottom: -8,
                          right: 0,
                        )
                      ]),
                ),
              ),
            ),
            EditCard(
              label: "Tên",
              userInfo: DataCenter.user["name"],
              toPage: AppRoutes.editName,
            ),
            const EditCard(
              label: "Ngày sinh",
              userInfo: "22/02/2022",
              toPage: AppRoutes.editDateOfBirth,
            ),
            const EditCard(
              label: "Giới tính",
              userInfo: "Nam",
              toPage: AppRoutes.editGender,
            ),
            const EditCard(
              label: "Đại học",
              userInfo: "VNU-UIT",
              toPage: AppRoutes.editUniversity,
            ),
            const EditCard(
                label: "Phone",
                userInfo: "*****897",
                toPage: AppRoutes.editPhoneNumber),
            const EditCard(
                label: "Email",
                userInfo: "abc@gmail.com",
                toPage: AppRoutes.editEmail),
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
