import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/modules/home/widgets/category_list_view.dart';

import '../../../core/values/app_colors.dart';

class HomeAllCategoryScreen extends StatelessWidget {
  const HomeAllCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
          elevation: 1,
          title: Text(
            "Tất cả danh mục",
            style: CustomTextStyle.h4(AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: Container(child: CategoryListView()),
      ),
    );
  }
}
