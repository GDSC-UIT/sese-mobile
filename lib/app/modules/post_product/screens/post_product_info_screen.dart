import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/data/services/upload_image_service.dart';
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
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.file(
                        File(postProductController.imageFileList[index].path),
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                    );
                  },
                  itemCount: postProductController.imageFileList.length,
                ),
              ),

              //name product
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'Product name'),
                  const SizedBox(
                    height: 6,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Enter your product name here',
                      isEnable: true,
                      controller:
                          postProductController.nameProductInputController)
                ],
              ),

              //product description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InfoLabel(isRequired: true, text: 'Description'),
                  const SizedBox(
                    height: 6,
                  ),
                  InPutTextField(
                    maxLine: 5,
                    textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                    hintText: 'Enter your product description here',
                    isEnable: true,
                    controller:
                        postProductController.descriptionProductInputController,
                  )
                ],
              ),

              Column(
                children: [
                  //price
                  InkWell(
                    onTap: () async {
                      await Get.toNamed(AppRoutes.postProductPrice);
                      if (postProductController
                          .priceInputController.text.isNotEmpty) {
                        postProductController.labelPrice.value =
                            postProductController.priceInputController.text;
                        if (postProductController.priceInputController.text
                            .startsWith("0")) {
                          postProductController.labelPrice.value = "Give-away";
                        }
                        postProductController.labelPrice.value +=
                            (postProductController.isNegotiable.value)
                                ? ", negotiable"
                                : ", non-negotiable";
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: InfoProductPropertyButton(
                      leading: Image.asset(
                        'assets/icons/Tag.png',
                      ),
                      title: Obx(() => InfoLabel(
                          isRequired: postProductController.labelPrice.value
                                  .toLowerCase() ==
                              "Price",
                          text: postProductController.labelPrice.value)),
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

                  InfoProductPropertyButton(
                    leading: Image.asset(
                      'assets/icons/Shopping_Bag_01.png',
                    ),
                    title: const InfoLabel(isRequired: false, text: 'Quantity'),
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
                      Get.back();
                      await Get.toNamed(AppRoutes.postProductCategory,
                          arguments: [categories]);
                      if (postProductController
                          .categoryInputController.text.isNotEmpty) {
                        postProductController.labelCategory.value =
                            postProductController.categoryInputController.text;
                        if (postProductController
                            .subCategoryInputController.text.isNotEmpty) {
                          postProductController.labelCategory.value +=
                              "- ${postProductController.subCategoryInputController.text}";
                        }
                      }
                      print("${postProductController.labelCategory.value}");
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: InfoProductPropertyButton(
                      leading: Image.asset(
                        'assets/icons/List_Unordered.png',
                      ),
                      title: Obx(() => InfoLabel(
                          isRequired: postProductController.labelCategory.value
                                  .toLowerCase() ==
                              "Category",
                          text: postProductController.labelCategory.value)),
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
                    onTap: () async {
                      await Get.toNamed(AppRoutes.postProductLocation);
                      FocusScope.of(context).unfocus();
                    },
                    child: InfoProductPropertyButton(
                      leading: Image.asset(
                        'assets/icons/Map_Pin.png',
                      ),
                      title:
                          const InfoLabel(isRequired: false, text: 'Location'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.backIcon,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              AppButton(
                onPress: () async {
                  Get.toNamed(AppRoutes.postProductWaiting);
                  //upload img to firestore
                  for (var element
                      in postProductController.imageFileList.value) {
                    String? response =
                        await UploadImageService.uploadImageToFirebase(
                            File(element.path), 'product_images');
                    //listImgProductUrl.add(response);
                    postProductController.listImgProductUrl.add(response);
                  }

                  Map<String, dynamic> categoryParam = {};
                  for (var e in postProductController.listParams) {
                    if (e["type"] == "dropdown") {
                      categoryParam["${e["param"]}"] = e["paramValue"];
                    } else {
                      categoryParam["${e["param"]}"] = e["controller"].text;
                    }
                  }

                  Map<String, dynamic> productInfo = {
                    "name": postProductController
                        .nameProductInputController.value.text,
                    "price":
                        postProductController.priceInputController.value.text,
                    "note": postProductController
                        .descriptionProductInputController.value.text,
                    "quantity": postProductController.quantity.value,
                    "location":
                        "${postProductController.provinceProductLoCationInputController.value.text}, ${postProductController.districtProductLoCationInputController.value.text}, ${postProductController.wardsProductLoCationInputController.value.text}",
                    "category": postProductController.idSubcategory.value,
                    "categoryParams": categoryParam,
                    "images": postProductController.listImgProductUrl,
                    "condition": "new",
                  };
                  var response = await HttpService.postRequest(
                    body: jsonEncode(productInfo),
                    url: UrlValue.appUrlPostProduct,
                  );
                  if (response.statusCode == 200) {
                    Get.toNamed(AppRoutes.postProductSuccess);
                  } else {
                    Get.toNamed(AppRoutes.postProductFail);
                  }
                },
                text: 'LIST NOW',
                borderColor: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor,
                textStyle: CustomTextStyle.t8(Colors.white),
              )
            ],
          ),
        ));
  }
}
