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
  HomeController homeController = Get.find<HomeController>();
  ScrollController scrollCategory = ScrollController();
  ScrollController scrollNewProduct = ScrollController();
  ScrollController scrollRecommendProduct = ScrollController();

  int notifi = 3;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screeenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              height: _screenHeight * 0.15,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: _screenHeight * 0.022,
                      ),
                      child: const Image(
                        image: Assets.imagesSese,
                        height: 27,
                        width: 67,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _screenHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Container(
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
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: _screeenWidth * 0.68,
                          height: 34,
                          child: SearchInput(
                            hintText: "Tìm kiếm sản phẩm",
                            color: Colors.transparent,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
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
                                  "Danh mục",
                                  style: CustomTextStyle.h4(Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.homeAllCategory);
                                  },
                                  child: Text(
                                    "Tất cả >",
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
                            height: _screenHeight * 0.14,
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
                                  "Sản phẩm mới",
                                  style: CustomTextStyle.h4(Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    homeController.typeScreen = "Sản phẩm mới";
                                    Get.toNamed(AppRoutes.homeCategory);
                                  },
                                  child: Text(
                                    "Xem thêm >",
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
                                  "Give away",
                                  style: CustomTextStyle.h4(Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    homeController.typeScreen = "Gợi ý";
                                    Get.toNamed(AppRoutes.homeCategory);
                                  },
                                  child: Text(
                                    "Xem tất cả >",
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
      ),
    );
  }
}
