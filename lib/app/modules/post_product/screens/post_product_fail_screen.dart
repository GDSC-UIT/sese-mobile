import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/routes/app_routes.dart';

class PostProductFailScreen extends StatelessWidget {
  const PostProductFailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Thêm sản phẩm',
          style: CustomTextStyle.h4(AppColors.primaryColor),
        ),
        leading: InkWell(
          onTap: () {
            Get.offAllNamed(AppRoutes.home);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 30,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/post_fail.png'),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Oops! Đã có lỗi xảy ra...',
              textAlign: TextAlign.center,
              style: CustomTextStyle.t4(AppColors.primaryColor),
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              'Đăng sản phẩm thất bại!',
              textAlign: TextAlign.center,
              style: CustomTextStyle.h2(AppColors.primaryColor),
            ),
            const SizedBox(
              height: 24,
            ),
            AppButton(
              onPress: () async {
                await Get.offAllNamed(AppRoutes.home);
                Get.toNamed(AppRoutes.postProductBegin);
              },
              text: 'Đăng sản phẩm khác',
              borderColor: AppColors.primaryColor,
              backgroundColor: AppColors.primaryColor,
              textStyle: CustomTextStyle.t8(Colors.white),
            ),
            const SizedBox(
              height: 24,
            ),
            AppButton(
              onPress: () {
                Get.offAllNamed(AppRoutes.home);
              },
              text: 'Quay lại trang chủ',
              borderColor: AppColors.neutralGrey,
              textStyle: CustomTextStyle.t8(AppColors.neutralGrey),
            ),
          ],
        ),
      ),
    );
  }
}
