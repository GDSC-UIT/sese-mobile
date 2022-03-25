import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';
import 'package:sese/app/modules/post_product/widgets/list_view_category.dart';

class PostProductCategoryScreen extends StatelessWidget {
  var categories = Get.arguments[0];

  var subCategory = [];
  PostProductCategoryScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final PostProductController postProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Danh mục sản phẩm',
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Category ',
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
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                    //toggle open list view
                    postProductController.isOpenedCategory.value =
                        !postProductController.isOpenedCategory.value;
                    postProductController.isOpenedSubCategory.value = false;
                    //when user choose new category reset the subCategory text
                    postProductController
                        .subCategoryInputController.value.text = '';
                  },
                  child: InPutTextField(
                    textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                    hintText: 'Chọn danh mục',
                    isEnable: false,
                    controller:
                        postProductController.categoryInputController.value,
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
            Obx(() => postProductController.isOpenedCategory.value
                ? ListViewCategory(
                    listItem: categories,
                    controller:
                        postProductController.categoryInputController.value,
                    type: TypeCategory.category,
                  )
                : const SizedBox()),
            const SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Subcategory ',
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
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                    if (postProductController.idCategory != '') {
                      //toggle open list view
                      postProductController.isOpenedSubCategory.value =
                          !postProductController.isOpenedSubCategory.value;
                      postProductController.isOpenedCategory.value = false;

                      //find the subcategory depend on id_categogy
                      var subListItem = categories.where((e) {
                        return e['_id'] == postProductController.idCategory;
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
                        : 'Chọn danh mục',
                    isEnable: false,
                    controller:
                        postProductController.subCategoryInputController.value,
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
            Obx(
              () => postProductController.isOpenedSubCategory.value
                  ? ListViewCategory(
                      listItem: subCategory,
                      controller: postProductController
                          .subCategoryInputController.value,
                      type: TypeCategory.subCategory,
                    )
                  : const SizedBox(),
            ),
            const SizedBox(
              height: 24,
            ),
            AppButton(
              onPress: () {},
              text: 'Xong',
              backgroundColor: AppColors.primaryColor,
              textStyle: CustomTextStyle.t8(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
