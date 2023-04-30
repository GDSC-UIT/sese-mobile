import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/home/home_controller.dart';

class Filter extends StatelessWidget {
  Filter({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screeenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      width: screeenWidth * 0.83,
      height: screenHeight,
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.105,
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
                  textField(
                      "Nơi bán", "TP Hồ Chí Minh", homeController.seller.value),
                  (homeController.typeScreen == "Sản phẩm mới" ||
                          homeController.typeScreen == "Gợi ý")
                      ? Container()
                      : textField(
                          "Danh mục", "Quần áo", homeController.seller.value),
                  textField("Tình trạng", "Mới", homeController.seller.value),
                  textField(
                      "Người bán", "phát covid", homeController.seller.value),
                  textField("Thời gian đăng", "1 giờ trước",
                      homeController.seller.value),
                  textField(
                      "Trường đại học",
                      "Trường đại học Công nghệ Thông tin",
                      homeController.seller.value),
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

Widget textField(String title, String hintText,
    TextEditingController textEditingController) {
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
        InPutTextField(
            hintText: hintText,
            isEnable: false,
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.backIcon,
            ),
            controller: textEditingController),
        Flexible(child: Container()),
      ],
    ),
  );
}
