import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/global_widgets/app_indicator.dart';
import 'package:sese/app/global_widgets/app_label.dart';
import 'package:sese/app/global_widgets/app_product_list_view.dart';
import 'package:sese/app/global_widgets/category.dart';
import 'package:sese/app/global_widgets/search_input.dart';
import 'package:sese/app/global_widgets/shopping_cart.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sese/app/modules/home/widgets/app_bottom_navigation_bar.dart';
import 'package:sese/app/modules/home/widgets/slider_banner.dart';
import 'package:sese/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  final sliderController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double headerHeight = height * 1 / 3;

    print('Home screen');
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: headerHeight,
                  padding: const EdgeInsets.only(
                      top: 8, left: 12, right: 12, bottom: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                    color: AppColors.mainHomeColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * 0.8,
                            height: 35,
                            child: const SearchInput(),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const ShoppingCart()
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SliderBanner(
                          sliderController: sliderController,
                          headerHeight: headerHeight),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => AppIndicator(
                            sliderLength: homeController.sliderImages.length,
                            sliderController: sliderController,
                            activeIndex: homeController.sliderIdx.value),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: -12,
                  left: 24,
                  child: AppLabel(content: 'Danh muc'),
                )
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Category(),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    top: -12,
                    left: 24,
                    child: AppLabel(
                      content: 'Sản phẩm mới',
                    ),
                  ),
                  Container(
                    color: AppColors.mainHomeBackGroundColor,
                    // child: AppProductListView(),
                    child: TextButton(
                      onPressed: () async {
                        if (AuthService.instance.loginMethod ==
                            LoginMethod.facebook) {
                          await AuthService.instance.faceBookSignOut();
                        } else {
                          await AuthService.instance.googleSignOut();
                        }
                        Get.offAllNamed(AppRoutes.authBegin);
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
