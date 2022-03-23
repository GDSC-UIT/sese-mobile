import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/post_product/widgets/quantity_input.dart';

class PostProductInfoScreen extends StatelessWidget {
  PostProductInfoScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    color: AppColors.lightGreyColor,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    color: AppColors.lightGreyColor,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    color: AppColors.lightGreyColor,
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Tên sản phẩm ',
                          style: CustomTextStyle.t2(AppColors.darkGreyColor),
                          children: const <TextSpan>[
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '0 / 120',
                        style: CustomTextStyle.t2(
                          AppColors.darkGreyColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Nhập tên sản phẩm',
                      isEnable: true,
                      controller: controller)
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Mô tả sản phẩm ',
                            style: CustomTextStyle.t2(AppColors.darkGreyColor),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '0 / 120',
                          style: CustomTextStyle.t2(
                            AppColors.darkGreyColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: InPutTextField(
                          maxLine: 4,
                          textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                          hintText: 'Nhập mô tả tại đây',
                          isEnable: true,
                          controller: controller),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InPutTextField(
                hintText: 'Giá',
                textStyle: CustomTextStyle.t2(AppColors.darkGreyColor),
                isEnable: false,
                controller: controller,
                prefixicon: Image.asset(
                  'assets/icons/Tag.png',
                ),
                suffixIcon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.backIcon,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              QuantityInput(controller: controller),
              const SizedBox(
                height: 8,
              ),
              InPutTextField(
                hintText: 'Danh mục',
                textStyle: CustomTextStyle.t2(AppColors.darkGreyColor),
                isEnable: false,
                controller: controller,
                prefixicon: Image.asset(
                  'assets/icons/List_Unordered.png',
                ),
                suffixIcon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.backIcon,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InPutTextField(
                hintText: 'Thêm thuộc tính khác',
                textStyle: CustomTextStyle.t2(AppColors.darkGreyColor),
                isEnable: false,
                controller: controller,
                prefixicon: Image.asset(
                  'assets/icons/Swatches_Palette.png',
                ),
                suffixIcon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.backIcon,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InPutTextField(
                hintText: 'Vị trí',
                textStyle: CustomTextStyle.t2(AppColors.darkGreyColor),
                isEnable: false,
                controller: controller,
                prefixicon: Image.asset(
                  'assets/icons/Map_Pin.png',
                ),
                suffixIcon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.backIcon,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              AppButton(
                onPress: () {},
                text: 'Dang san pham',
                backgroundColor: AppColors.primaryColor,
                textStyle: CustomTextStyle.t8(Colors.white),
              )
            ],
          ),
        ));
  }
}
