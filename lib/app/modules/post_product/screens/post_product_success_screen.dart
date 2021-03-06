import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';

import '../../../routes/app_routes.dart';

class PostProductSuccessScreen extends StatelessWidget {
  const PostProductSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List your products',
          style: CustomTextStyle.h4(AppColors.primaryColor),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
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
            Image.asset('assets/images/post_success.png'),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Your item was listed successfully!',
              textAlign: TextAlign.center,
              style: CustomTextStyle.h2(AppColors.darkGreyColor),
            ),
            const SizedBox(
              height: 24,
            ),
            AppButton(
              onPress: () async {
                //await Get.offAllNamed(AppRoutes.home);
                Get.toNamed(AppRoutes.postProductBegin);
              },
              text: 'LIST ANOTHER ITEM',
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
              text: 'BACK TO HOME SCREEN',
              borderColor: AppColors.neutralGrey,
              textStyle: CustomTextStyle.t8(AppColors.neutralGrey),
            ),
          ],
        ),
      ),
    );
  }
}
