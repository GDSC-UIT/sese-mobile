import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';
import 'package:sese/app/modules/post_product/widgets/adjust_quantity_button.dart';
import 'package:sese/app/modules/post_product/widgets/info_label.dart';
import 'package:sese/app/modules/post_product/widgets/info_product_property_button.dart';
import 'package:sese/app/modules/post_product/widgets/quantity_input.dart';
import 'package:sese/app/routes/app_routes.dart';

class PostProductInfoScreen extends StatelessWidget {
  PostProductInfoScreen({Key? key}) : super(key: key);

  PostProductController postProductController = Get.find();
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
              //list product image
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
              //name product
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const InfoLabel(isRequired: true, text: 'Tên sản phẩm'),
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
                      controller: postProductController
                          .nameProductInputController.value)
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              //product description
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const InfoLabel(
                            isRequired: true, text: 'Mô tả sản phẩm'),
                        Text(
                          '0 / 1000',
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
                        controller: postProductController
                            .descriptionProductInputController.value,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //price
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.postProductPrice);
                },
                child: InfoProductPropertyButton(
                  leading: Image.asset(
                    'assets/icons/Tag.png',
                  ),
                  title: const InfoLabel(isRequired: true, text: 'Giá'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.backIcon,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //quantity
              InfoProductPropertyButton(
                leading: Image.asset(
                  'assets/icons/Shopping_Bag_01.png',
                ),
                title: const InfoLabel(isRequired: true, text: 'Số lượng'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          postProductController.quantity.value++;
                        },
                        child: const AdjustQuantityButton(
                          text: '+',
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    Obx(() => Text(
                          '${postProductController.quantity.value}',
                          style: CustomTextStyle.t8(
                            AppColors.darkGreyColor,
                          ),
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                        onTap: () {
                          if (postProductController.quantity.value > 1) {
                            postProductController.quantity.value--;
                          }
                        },
                        child: const AdjustQuantityButton(
                          text: '-',
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //product category
              InkWell(
                onTap: () async {
                  HttpService.showLoadingIndecator();
                  var response = await HttpService.getRequest(
                      UrlValue.appUrlGetAllCategories);
                  var categories = json.decode(response.body)['categories'];

                  Get.toNamed(AppRoutes.postProductCategory,
                      arguments: [categories]);
                },
                child: InfoProductPropertyButton(
                  leading: Image.asset(
                    'assets/icons/List_Unordered.png',
                  ),
                  title: const InfoLabel(isRequired: true, text: 'Danh Mục'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.backIcon,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              //location
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.postProductLocation);
                },
                child: InfoProductPropertyButton(
                  leading: Image.asset(
                    'assets/icons/Map_Pin.png',
                  ),
                  title: const InfoLabel(isRequired: true, text: 'Vị trí'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.backIcon,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
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
