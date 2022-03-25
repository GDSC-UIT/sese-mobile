import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/global_widgets/app_new_product_list_view.dart';
import 'package:sese/app/global_widgets/app_recommend_product_list_view.dart';
import 'package:sese/app/global_widgets/category.dart';
import 'package:sese/app/global_widgets/search_input.dart';
import 'package:sese/app/global_widgets/shopping_cart.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/global_widgets/app_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  ScrollController scrollCategory = ScrollController();
  ScrollController scrollNewProduct = ScrollController();
  ScrollController scrollRecommendProduct = ScrollController();

  int notifi = 12;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screeenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      bottomNavigationBar: AppBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                              image: const DecorationImage(
                                image: Assets.imagesAvatar,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: _screeenWidth * 0.7,
                            height: 34,
                            child: const SearchInput(),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ShoppingCart(notifi),
                        ],
                      ),
                    ),
                  ],
                ),
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
                            "Danh mục",
                            style: CustomTextStyle.h4(Colors.black),
                          ),
                          Text(
                            "Tất cả >",
                            style: CustomTextStyle.t4(AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: _screenHeight * 0.14,
                      child: Category(
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
                          Text(
                            "Xem thêm >",
                            style: CustomTextStyle.t4(AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: _screenHeight * 0.26,
                      child: AppNewProductListView(
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
                            "Gợi ý cho bạn",
                            style: CustomTextStyle.h4(Colors.black),
                          ),
                          Text(
                            "Xem tất cả >",
                            style: CustomTextStyle.t4(AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: _screenHeight * 0.26,
                      child: AppRecommendProductListView(
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
    );
  }
}
