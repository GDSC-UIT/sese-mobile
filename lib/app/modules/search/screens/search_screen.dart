import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/search/search_binding.dart';
import 'package:sese/app/modules/search/search_controller.dart';
import 'package:sese/app/modules/search/widgets/product_info.dart';

class SearchScreen extends StatelessWidget {
  SearchController searchController = Get.find();

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //search input
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.backIcon,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      onSubmitted: (value) async {
                        print(value);

                        HttpService.showLoadingIndecator();
                        var response = await HttpService.getRequest(
                            '${UrlValue.appUrlPostProduct}?q=$value');
                        searchController.listProduct.value =
                            json.decode(response.body)['posts'];
                        searchController.isFirst.value = false;
                        Get.back();
                        print('list:${searchController.listProduct.value}');
                      },
                      style: CustomTextStyle.t6(AppColors.darkGreyColor),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.greenColor,
                        ),
                        hintText: 'Search here',
                        hintStyle: CustomTextStyle.t6(AppColors.darkGreyColor),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.lightGreen,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.greenColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //body
            Obx(
              () => searchController.listProduct.value.length > 0
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //sort
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: AppColors.greenColor),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.sort,
                                  color: AppColors.darkGreyColor,
                                ),
                                const SizedBox(
                                  width: 32,
                                ),
                                Text(
                                  'Xắp xếp: đề cử ',
                                  style: CustomTextStyle.t6(
                                      AppColors.darkGreyColor),
                                )
                              ],
                            ),
                          ),
                          //body
                          Expanded(
                            child: Container(
                              color: AppColors.cloadDarkColor,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tìm thấy ${searchController.listProduct.length} sản phẩm',
                                    style: CustomTextStyle.t10(
                                      AppColors.darkGreyColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return ProductInfo(
                                              productImgUrl: searchController
                                                      .listProduct[index]
                                                  ["images"][0],
                                              nameProduct: searchController
                                                  .listProduct[index]["name"],
                                              userImgUrl: searchController
                                                      .listProduct[index]
                                                  ['user']['avatar'],
                                              nameUser: searchController
                                                      .listProduct[index]
                                                  ['user']['name'],
                                              location: searchController
                                                      .listProduct[index]
                                                  ['location'],
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                                height: 8,
                                              ),
                                          itemCount: searchController
                                              .listProduct.length),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : searchController.isFirst.value == true
                      ? const SizedBox()
                      : Column(
                          children: [
                            const SizedBox(
                              height: 64,
                            ),
                            Image.asset(
                              'assets/images/post_fail.png',
                              scale: 1.2,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Not Found Any Thing!!!',
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.t4(AppColors.primaryColor),
                            ),
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
