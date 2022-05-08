import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
            child: Column(
              children: [
                TextField(
                  "Giá cả",
                  'Không có',
                  homeController.seller.value,
                  homeController.listPrice,
                  homeController.selectedPriceFilter.value,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.cloadDarkColor,
                ),
                TextField(
                  "Nơi bán",
                  'Không có',
                  homeController.seller.value,
                  homeController.listSellerPlace,
                  homeController.selectedSellerPlaceFilter.value,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.cloadDarkColor,
                ),
                if (homeController.typeScreen == "Sản phẩm mới" ||
                    homeController.typeScreen == "Gợi ý")
                  Container()
                else
                  TextField(
                    "Danh mục",
                    'Không có',
                    homeController.seller.value,
                    homeController.listCategory,
                    homeController.selectedCategoryFilter.value,
                  ),
                if (homeController.typeScreen == "Sản phẩm mới" ||
                    homeController.typeScreen == "Gợi ý")
                  Container()
                else
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.cloadDarkColor,
                  ),
                TextField(
                  "Tình trạng",
                  'Không có',
                  homeController.seller.value,
                  homeController.listStatus,
                  homeController.selectedStatusFilter.value,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.cloadDarkColor,
                ),
                (homeController.typeScreen == "Sản phẩm mới" ||
                        homeController.typeScreen == "Gợi ý")
                    ? Flexible(child: Container())
                    : Container(),
                const SizedBox(
                  height: 7,
                ),
                const Expanded(child: const SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPress: () {},
                          text: "Áp dụng",
                          textStyle: CustomTextStyle.t3(Colors.white),
                          backgroundColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
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
                ),
                const SizedBox(
                  height: 26,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget TextField(
  String title,
  String hintText,
  TextEditingController textEditingController,
  List<String> listItem,
  String selectedValue,
) {
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Container()),
          Text(
            title,
            style: CustomTextStyle.t3(Colors.black),
          ),
          Flexible(child: Container()),
          DropdownButtonFormField2(
            enableFeedback: true,
            focusColor: AppColors.backIcon,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            hint: Text(
              hintText,
              style: CustomTextStyle.t6(AppColors.neutralGrey),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.backIcon,
            ),
            iconSize: 30,
            dropdownMaxHeight: 300,
            buttonHeight: 48,
            buttonDecoration: BoxDecoration(
              border: Border.all(color: AppColors.backIcon),
              borderRadius: BorderRadius.circular(5),
            ),
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            isExpanded: true,
            items: listItem
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: CustomTextStyle.t6(AppColors.neutralGrey),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select gender.';
              }
            },
            onChanged: (value) {
              //Do something when changing the item if you want.
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
          ),
          Flexible(
            child: Container(),
          ),
        ],
      ),
    ),
  );
}
