import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/models/app_category_model.dart';
import 'package:sese/app/data/models/sub_category.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
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
      resizeToAvoidBottomInset: false,
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
              'My university is',
              style: CustomTextStyle.h1(AppColors.primaryColor),
            ),
            const SizedBox(
              height: 16,
            ),
            InPutTextFieldRecommendLogin(
              hintText: "Fill your university's name here",
              controller: loginController.schoolInputController.value,
              onChange: loginController.searchSchool,
              textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => loginController.recommendUniName.isEmpty
                  ? const SizedBox()
                  : SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              loginController.schoolInputController.value.text =
                                  loginController.recommendUniName[index];
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                loginController.recommendUniName[index],
                                style:
                                    CustomTextStyle.t8(AppColors.neutralGrey),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.recommendBackground,
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
              height: 24,
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
                      DataCenter.appSubCategory[subCategory[sub["_id"]]!.id] =
                          subCategory[sub["_id"]];
                    });
                    DataCenter.appCategory[item["_id"]] = AppCategoryModel(
                        id: item['_id'],
                        imageUrl: item['image'],
                        name: item['name'],
                        subCategory: subCategory);
                  });
                  log("Appcategory1name:${DataCenter.appCategory["623be0cac61a2e8a00b9b05e"]?.name}");
                  log("Appcategory1imagUrl:${DataCenter.appCategory["623be0cac61a2e8a00b9b05e"]?.imageUrl}");
                  log("Appcategory1SubCate:${DataCenter.appCategory["623be0cac61a2e8a00b9b05e"]?.subCategory["623be0cac61a2e8a00b9b061"]?.params}");
                  Get.toNamed(AppRoutes.authInterest,
                      arguments: [listInterests]);
                } else {
                  Get.snackbar('', 'Please fill all  the field!');
                }
              },
              text: 'NEXT',
              textStyle: CustomTextStyle.t8(Colors.white),
              backgroundColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
