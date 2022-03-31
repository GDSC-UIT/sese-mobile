import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/models/app_category_model.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/data/models/subCategory_model.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/modules/login/widgets/input_text_field_recommend_login.dart';
import 'package:sese/app/routes/app_routes.dart';

// ignore: must_be_immutable
class LoginUniversityScreen extends StatelessWidget {
  LoginUniversityScreen({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              'Mình học tại',
              style: CustomTextStyle.h1(AppColors.primaryColor),
            ),
            const SizedBox(
              height: 16,
            ),
            InPutTextFieldRecommendLogin(
              hintText: 'Nhập tên trường',
              controller: loginController.schoolInputController.value,
              onChange: loginController.searchSchool,
              textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
            ),
            Obx(
              () => loginController.recommendUniName.isEmpty
                  ? const SizedBox()
                  : Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              loginController.schoolInputController.value.text =
                                  loginController.recommendUniName[index];
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                loginController.recommendUniName[index],
                                style: CustomTextStyle.t8(Colors.white),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          );
                        },
                        itemCount: loginController.recommendUniName.length > 5
                            ? 5
                            : loginController.recommendUniName.length,
                      ),
                    ),
            ),
            const SizedBox(
              height: 64,
            ),
            AppButton(
              onPress: () async {
                if (loginController.schoolInputController.value.value.text !=
                    '') {
                  HttpService.showLoadingIndecator();
                  var response = await HttpService.getRequest(
                      UrlValue.appUrlGetAllCategories);
                  var listInterests = json.decode(response.body)['categories'];
                  //loop list of category
                  listInterests.forEach((item) {
                    //set  isSelect property
                    item['isSelected'] = false;

                    //get subcategoryList
                    var subCategoriesList = item["subcategories"];
                    //create subCategory
                    Map<String, SubCategory> subCategory = {};
                    subCategoriesList.forEach((sub) {
                      //get params of sub
                      var subParam = sub["params"];
                      Map<String, dynamic> params = {};
                      //loop subParam
                      subParam.forEach((param) {
                        params[param["param"]] = param;
                      });
                      //create subCategory
                      subCategory[sub["_id"]] = SubCategory(
                        category: sub["category"],
                        name: sub["name"],
                        id: sub["_id"],
                        params: params,
                      );
                    });
                    DataCenter.appCategory[item["_id"]] = AppCategoryModel(
                        id: item['_id'],
                        imageUrl: item['image'],
                        name: item['name'],
                        subCategory: subCategory);
                  });
                  print(
                      "Appcategory1name:${DataCenter.appCategory["623be0cac61a2e8a00b9b05e"]?.name}");
                  print(
                      "Appcategory1imagUrl:${DataCenter.appCategory["623be0cac61a2e8a00b9b05e"]?.imageUrl}");
                  print(
                      "Appcategory1SubCate:${DataCenter.appCategory["623be0cac61a2e8a00b9b05e"]?.subCategory["623be0cac61a2e8a00b9b061"]?.params}");
                  Get.toNamed(AppRoutes.authInterest,
                      arguments: [listInterests]);
                } else {
                  Get.snackbar('', 'Please fill all  the field!');
                }
              },
              text: 'TIẾP TỤC NHA',
              textStyle: CustomTextStyle.t8(Colors.white),
              backgroundColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
