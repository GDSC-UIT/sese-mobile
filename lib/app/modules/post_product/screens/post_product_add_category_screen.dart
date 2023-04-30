import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';
import 'package:sese/app/modules/post_product/widgets/info_label.dart';
import 'package:sese/app/modules/post_product/widgets/list_view_category.dart';
import 'package:sese/app/modules/post_product/widgets/list_view_params.dart';

class PostProductCategoryScreen extends StatefulWidget {
  const PostProductCategoryScreen({Key? key}) : super(key: key);

  @override
  State<PostProductCategoryScreen> createState() =>
      _PostProductCategoryScreenState();
}

class _PostProductCategoryScreenState extends State<PostProductCategoryScreen> {
  final categories = Get.arguments[0];

  var subCategory = [];

  final TextEditingController controller = TextEditingController();

  final PostProductController postProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product Category',
            style: CustomTextStyle.h4(AppColors.primaryColor),
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.backIcon,
              size: 30,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //category
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InfoLabel(isRequired: true, text: 'Category'),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          //toggle open list view
                          postProductController.isOpenedCategory.value =
                              !postProductController.isOpenedCategory.value;
                          postProductController.isOpenedSubCategory.value =
                              false;
                          //when user choose new category reset the subCategory text
                          postProductController
                              .subCategoryInputController.text = '';
                          postProductController.idSubcategory.value = '';
                        },
                        child: InPutTextField(
                          textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                          hintText: 'Choose category for your product',
                          isEnable: false,
                          controller:
                              postProductController.categoryInputController,
                          suffixIcon: const Icon(
                            Icons.expand_more,
                            color: AppColors.greenColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //List view category
                  Obx(() => postProductController.isOpenedCategory.value
                      ? ListViewCategory(
                          listItem: categories,
                          controller:
                              postProductController.categoryInputController,
                          type: TypeCategory.category,
                        )
                      : const SizedBox()),
                  const SizedBox(
                    height: 24,
                  ),
                  //subcategory
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InfoLabel(isRequired: true, text: 'Subcategory'),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          if (postProductController.idCategory != '') {
                            //toggle open list view
                            postProductController.isOpenedSubCategory.value =
                                !postProductController
                                    .isOpenedSubCategory.value;
                            postProductController.isOpenedCategory.value =
                                false;

                            //find the subcategory depend on id_categogy
                            var subListItem = categories.where((e) {
                              return e['_id'] ==
                                  postProductController.idCategory;
                            }).toList();
                            subCategory = subListItem[0]['subcategories'];
                          } else {
                            Get.snackbar(
                                'App message', 'Please choose category first');
                          }
                        },
                        child: InPutTextField(
                          textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                          hintText: postProductController
                                      .subCategoryInputController.value.text !=
                                  ''
                              ? postProductController
                                  .subCategoryInputController.value.text
                              : 'Choose subcategory',
                          isEnable: false,
                          controller:
                              postProductController.subCategoryInputController,
                          suffixIcon: const Icon(
                            Icons.expand_more,
                            color: AppColors.greenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //list view subcategory
                  Obx(
                    () => postProductController.isOpenedSubCategory.value
                        ? ListViewCategory(
                            listItem: subCategory,
                            controller: postProductController
                                .subCategoryInputController,
                            type: TypeCategory.subCategory,
                          )
                        : const SizedBox(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  //params
                  Obx(
                    () => postProductController.idSubcategory.value != ''
                        ? Column(
                            children: postProductController.listParams.map((e) {
                              if (e["type"] == "dropdown") {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InfoLabel(
                                        isRequired: true,
                                        text: '${e["label"]}'),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        log('click');
                                        int index = e["index"];
                                        var temp = postProductController
                                            .listParams[index];
                                        temp["isOpen"] = !temp["isOpen"];
                                        postProductController
                                            .listParams[index] = temp;
                                        log(postProductController
                                            .listParams[index]);
                                      },
                                      child: InPutTextField(
                                        textStyle: CustomTextStyle.t6(
                                            AppColors.neutralGrey),
                                        hintText: e["controller"].text != ''
                                            ? e["controller"].text
                                            : 'Choose ${e["label"]}',
                                        isEnable: false,
                                        controller: e["controller"],
                                        suffixIcon: const Icon(
                                          Icons.expand_more,
                                          color: AppColors.greenColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Obx(
                                      () => postProductController
                                                      .listParams[e["index"]]
                                                  ["isOpen"] ==
                                              true
                                          ? ListViewParams(
                                              listItem: e["options"],
                                              controller: e['controller'],
                                              idx: e["index"],
                                            )
                                          : const SizedBox(),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                  ],
                                );
                              }
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InfoLabel(
                                        isRequired: true,
                                        text: '${e["label"]}'),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    InPutTextField(
                                      textStyle: CustomTextStyle.t6(
                                          AppColors.neutralGrey),
                                      hintText: e["controller"].text != ''
                                          ? e["controller"].text
                                          : 'Enter ${e["label"]}',
                                      isEnable: true,
                                      controller: e["controller"],
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                  ]);
                            }).toList(),
                          )
                        : const SizedBox(),
                  ),
                  AppButton(
                    onPress: () {
                      Get.back();
                    },
                    text: 'APPLY',
                    backgroundColor: AppColors.primaryColor,
                    textStyle: CustomTextStyle.t8(Colors.white),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
