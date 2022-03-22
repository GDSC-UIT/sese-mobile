import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/edit_profile/widgets/edit_card.dart';

class EditUserProfileScreen extends StatelessWidget {
  const EditUserProfileScreen({Key? key}) : super(key: key);

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
          onPressed: () {},
        ),
        title: Text("Thông tin cá nhân",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 47),
            child: Center(
              child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  overflow: Overflow.visible,
                  children: const [
                    SizedBox(
                      width: 96,
                      height: 96,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 50,
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.backIcon,
                        child: Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      bottom: -8,
                      right: 0,
                    )
                  ]),
            ),
          ),
          const EditCard(lable: "Tên", userInfo: "meow"),
          const EditCard(lable: "Ngày sinh", userInfo: "22/02/2022"),
          const EditCard(lable: "Giới tính", userInfo: "Nam"),
          const EditCard(lable: "Đại học", userInfo: "VNU-UIT"),
          const EditCard(lable: "Phone", userInfo: "*****897"),
          const EditCard(lable: "Email", userInfo: "abc@gmail.com"),
          const EditCard(lable: "Tài khoản liên kết", userInfo: ""),
        ],
      ),
    );
  }
}
