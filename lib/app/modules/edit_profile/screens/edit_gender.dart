import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_constant.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/edit_profile/widgets/checkbox.dart';

class EditGender extends StatelessWidget {
  const EditGender({Key? key}) : super(key: key);

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
        title: Text("Giới tính",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
        child: Column(children: [
           GenderCheckBox(gender: "Nam"),
           GenderCheckBox(gender: "Nữ"),
           GenderCheckBox(gender: "Khác"),
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
