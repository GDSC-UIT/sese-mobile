import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/home/home_controller.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';

class HomeReportScreen extends StatelessWidget {
  HomeReportScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomToggleButton(
                  "Sản phẩm bị cấm buôn bán (động vật hoang dã, 18+, ....)",
                  homeController,
                  0),
              CustomToggleButton("Hàng giả, hàng nhái", homeController, 1),
              CustomToggleButton(
                  "Sản phẩm không rõ nguồn gốc, xuất xứ", homeController, 2),
              CustomToggleButton(
                  "Hình ảnh sản phẩm không rõ ràng", homeController, 3),
              CustomToggleButton(
                  "Sản phẩm có hình ảnh, nội dung phản cảm hoặc có thể gây phản cảm",
                  homeController,
                  4),
              CustomToggleButton(
                  "Sản phẩm có dấu hiệu lừa đảo", homeController, 5),
              CustomToggleButton("Khác", homeController, 6),
              const SizedBox(
                height: 120,
              ),
              AppButton(
                onPress: () {},
                text: "Tố cáo",
                textStyle: CustomTextStyle.t1(Colors.white),
                backgroundColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CustomToggleButton(
    String text, HomeController homeController, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: GestureDetector(
      onTap: () {
        homeController.listReportBool[index] =
            !homeController.listReportBool[index];
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              style: CustomTextStyle.t2(Colors.black),
            ),
          ),
          Obx(() => homeController.listReportBool[index]
              ? Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(
                      color: AppColors.cloadDarkColor,
                      width: 2,
                    ),
                    color: AppColors.primaryColor,
                  ),
                )
              : const Icon(
                  Icons.circle_outlined,
                  size: 30,
                  color: AppColors.cloadDarkColor,
                )),
        ],
      ),
    ),
  );
}
