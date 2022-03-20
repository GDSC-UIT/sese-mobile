import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/routes/app_routes.dart';

class VerifySuccessScreen extends StatelessWidget {
  const VerifySuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 259,
                ),
                Container(
                  height: 110,
                  width: 110,
                  child: const Icon(
                    Icons.check,
                    size: 70,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Chào mừng bạn đến với",
                  style: CustomTextStyle.h2(Colors.black),
                ),
                Text(
                  "Se Sẻ!",
                  style: CustomTextStyle.h2(Colors.black),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  width: 251,
                  child: Center(
                    child: Text(
                      "Dữ liệu của bạn sẽ được lưu ở chế độ riêng tư và bây giờ bạn có thể tận hưởng tất cả các tính năng của Se Sẻ",
                      style: CustomTextStyle.t5(AppColors.neutralGrey),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                AppButton(
                  onPress: () {
                    Get.toNamed(AppRoutes.testImage);
                  },
                  text: "Bắt đầu thôi !",
                  textStyle: CustomTextStyle.t1(Colors.white),
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
