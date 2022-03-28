import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/home/home_controller.dart';

class Filter extends StatelessWidget {
  Filter({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    double _screeenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      width: _screeenWidth * 0.83,
      height: _screenHeight,
      child: Column(
        children: [
          Container(
            height: _screenHeight * 0.105,
            color: AppColors.primaryColor,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 11, bottom: 9),
                child: Text(
                  "Bộ lọc tìm kiếm",
                  style: CustomTextStyle.h3(Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField("Nơi bán"),
                  (homeController.typeScreen == "Sản phẩm mới" ||
                          homeController.typeScreen == "Gợi ý")
                      ? Container()
                      : TextField("Danh mục"),
                  TextField("Tình trạng"),
                  TextField("Người bán"),
                  TextField("Thời gian đăng"),
                  TextField("Trường đại học"),
                  (homeController.typeScreen == "Sản phẩm mới" ||
                          homeController.typeScreen == "Gợi ý")
                      ? Flexible(child: Container())
                      : Container(),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPress: () {},
                          text: "Áp dụng",
                          textStyle: CustomTextStyle.t3(Colors.white),
                          backgroundColor: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      Expanded(
                        child: AppButton(
                          onPress: () {},
                          text: "Thiết lập lại",
                          textStyle: CustomTextStyle.t3(AppColors.primaryColor),
                          borderColor: AppColors.primaryColor,
                          backgroundColor: AppColors.lightOrange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget TextField(String title) {
  return Flexible(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: Container()),
        Text(
          title,
          style: CustomTextStyle.t3(Colors.black),
        ),
        Flexible(child: Container()),
        AppButton(
          onPress: () {},
          text: "alo alo",
          backgroundColor: AppColors.primaryColor,
        ),
        Flexible(child: Container()),
      ],
    ),
  );
}
