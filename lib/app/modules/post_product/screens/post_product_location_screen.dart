import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';
import 'package:sese/app/modules/post_product/widgets/info_label.dart';

class PostProductLocationScreen extends StatelessWidget {
  PostProductLocationScreen({Key? key}) : super(key: key);
  PostProductController postProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Vị trí của bạn',
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Sử dụng vị trí mặc định',
                style: CustomTextStyle.t2(
                  AppColors.neutralGrey,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'Tỉnh thành'),
                  const SizedBox(
                    height: 8,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Nhập tỉnh thành',
                      isEnable: true,
                      controller: postProductController
                          .provinceProductLoCationInputController.value)
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'Quận/Huyện'),
                  const SizedBox(
                    height: 8,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Nhập quận/huyện',
                      isEnable: true,
                      controller: postProductController
                          .districtProductLoCationInputController.value)
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'Phường/Xã'),
                  const SizedBox(
                    height: 8,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Nhập phường/xã',
                      isEnable: true,
                      controller: postProductController
                          .districtProductLoCationInputController.value)
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                onPress: () {},
                text: 'Đăng sản phẩm',
                borderColor: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor,
                textStyle: CustomTextStyle.t8(Colors.white),
              )
            ],
          ),
        ));
  }
}
