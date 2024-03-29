import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/global_widgets/horizontal_product_list_view.dart';
import 'package:sese/app/modules/home/widgets/list_category.dart';
import 'package:sese/app/global_widgets/notify_icon.dart';
import 'package:sese/app/global_widgets/search_input.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/global_widgets/app_bottom_navigation_bar.dart';
import 'package:sese/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final ScrollController scrollCategory = ScrollController();
  final ScrollController scrollNewProduct = ScrollController();
  final ScrollController scrollRecommendProduct = ScrollController();
  final listNewProduct = Get.arguments[0];
  final listRecommendProduct = Get.arguments[1];

  final int notifi = 3;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screeenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(
        () => AppBottomNavigationBar(
          selectedIndex: homeController.pageIdx.value,
          onTap: (index) {
            homeController.pageIdx.value = index;
          },
          onPressButton: () => Get.toNamed(AppRoutes.postProductBegin),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16),
            color: AppColors.primaryColor,
            height: screenHeight * 0.16,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.022,
                    ),
                    child: const Image(
                      image: Assets.imagesSese,
                      height: 27,
                      width: 67,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          log("list recommend: ${listRecommendProduct[0]["name"]}");
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            image: DecorationImage(
                              image: Image.network(FirebaseAuth
                                          .instance.currentUser!.photoURL ??
                                      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200&d=mm&r=g")
                                  .image,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.search);
                        },
                        child: SizedBox(
                          width: screeenWidth * 0.68,
                          height: 34,
                          child: const SearchInput(
                            hintText: "Search",
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      NotifyIcon(notifi),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Category",
                                style: CustomTextStyle.h4(Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.homeAllCategory);
                                },
                                child: Text(
                                  "View all >",
                                  style: CustomTextStyle.t4(
                                      AppColors.primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: screenHeight * 0.14,
                          child: ListCategory(
                            homeController: homeController,
                            scrollController: scrollCategory,
                          ),
                        ),
                        ScrollIndicator(
                          width: 48,
                          height: 5,
                          indicatorWidth: 15,
                          scrollController: scrollCategory,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.neutralGrey,
                          ),
                          indicatorDecoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Now giving away!",
                                style: CustomTextStyle.h4(Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  homeController.typeScreen = "Sản phẩm mới";
                                  Get.toNamed(AppRoutes.homeCategory);
                                },
                                child: Text(
                                  "View all >",
                                  style: CustomTextStyle.t4(
                                      AppColors.primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 220,
                          child: HorizontalProductListView(
                              isGiveAway: true,
                              listProduct: listNewProduct,
                              scrollController: scrollNewProduct),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ScrollIndicator(
                          width: 48,
                          height: 5,
                          indicatorWidth: 15,
                          scrollController: scrollNewProduct,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.neutralGrey,
                          ),
                          indicatorDecoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recommended",
                                style: CustomTextStyle.h4(Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  homeController.typeScreen = "Gợi ý";
                                  Get.toNamed(AppRoutes.homeCategory);
                                },
                                child: Text(
                                  "View all >",
                                  style: CustomTextStyle.t4(
                                      AppColors.primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 220,
                          child: HorizontalProductListView(
                              isGiveAway: false,
                              listProduct: listRecommendProduct,
                              scrollController: scrollRecommendProduct),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ScrollIndicator(
                          width: 48,
                          height: 5,
                          indicatorWidth: 15,
                          scrollController: scrollRecommendProduct,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.neutralGrey,
                          ),
                          indicatorDecoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                      ],
                    ),
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
