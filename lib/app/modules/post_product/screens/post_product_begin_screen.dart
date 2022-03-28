import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_bottom_navigation_bar.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

class PostProductBeginScreen extends StatelessWidget {
  PostProductBeginScreen({Key? key}) : super(key: key);
  PostProductController postProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Thêm sản phẩm',
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
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/post_product_begin.png'),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Bắt đầu bán nào!',
              style: CustomTextStyle.h2(AppColors.darkGreyColor),
            ),
            // Expanded(
            //   child: Obx(
            //     () => postProductController.imageFileList.isNotEmpty
            //         ? Row(
            //             children: postProductController.imageFileList
            //                 .map(
            //                   (element) => Image.file(
            //                     File(element.path),
            //                   ),
            //                 )
            //                 .toList(),
            //           )
            //         : Container(),
            //   ),
            // ),
            const SizedBox(
              height: 64,
            ),

            AppButton(
              onPress: () async {
                await postProductController.pickImage(ImageSource.gallery);
                Get.toNamed(AppRoutes.postProductInfo);
              },
              text: 'CHỌN ẢNH TỪ THƯ VIỆN',
              textStyle: CustomTextStyle.t8(AppColors.primaryColor),
              backgroundColor: AppColors.lightOrange,
              borderColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
