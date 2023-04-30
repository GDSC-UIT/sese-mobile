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
  final PostProductController postProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product Location',
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
              Row(
                children: [
                  Obx(
                    () => Switch(
                        inactiveThumbColor: AppColors.primaryColor,
                        activeTrackColor: AppColors.primaryColor,
                        activeColor: Colors.white,
                        value: postProductController.isUseDefaultLoca.value,
                        onChanged: (value) {
                          postProductController.isUseDefaultLoca.value = value;
                        }),
                  ),
                  Text(
                    'Use default location',
                    style: CustomTextStyle.t2(
                      AppColors.neutralGrey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'City'),
                  const SizedBox(
                    height: 8,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Enter your city',
                      isEnable: true,
                      controller: postProductController
                          .provinceProductLoCationInputController)
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'District'),
                  const SizedBox(
                    height: 8,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Enter your district',
                      isEnable: true,
                      controller: postProductController
                          .districtProductLoCationInputController)
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'Ward'),
                  const SizedBox(
                    height: 8,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Enter your ward',
                      isEnable: true,
                      controller: postProductController
                          .wardsProductLoCationInputController)
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                onPress: () {
                  Get.back();
                },
                text: 'APPLY',
                borderColor: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor,
                textStyle: CustomTextStyle.t8(Colors.white),
              )
            ],
          ),
        ));
  }
}
