import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/modules/home/widgets/detail_product.dart';
import 'package:sese/app/modules/home/widgets/info_product.dart';
import 'package:sese/app/modules/home/widgets/info_seller.dart';
import 'package:sese/app/modules/home/widgets/user_evaluate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/values/app_colors.dart';
import '../../../global_widgets/horizontal_product_list_view.dart';
import '../../../routes/app_routes.dart';

class HomeDetailProductScreen extends StatefulWidget {
  HomeDetailProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDetailProductScreen> createState() =>
      _HomeDetailProductScreenState();
}

class _HomeDetailProductScreenState extends State<HomeDetailProductScreen> {
  final HomeController homeController = Get.find();
  int activeIndex = 0;
  final urlImages = [
    "https://www.techsignin.com/wp-content/uploads/2021/11/172965-nhung-con-so-gdg-devfest-hcmc-2021-2.jpg",
    "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_3,f_auto,g_center,h_175,q_auto:good,w_175/v1/gcs/platform-data-goog/events/%E1%84%8B%E1%85%A1%E1%86%AB%E1%84%83%E1%85%B3%E1%84%85%E1%85%A9%E1%84%8B%E1%85%B5%E1%84%83%E1%85%B3%E1%84%86%E1%85%A9%E1%84%89%E1%85%A7%E1%86%AB%E1%84%85%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%AE%E1%86%BA.png",
    "https://images.tkbcdn.com/1/1560/600/Upload/eventcover/2018/11/16/BF1C60.jpg"
  ];

  ScrollController scrollNewProduct = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _screeenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  onPress: () {},
                  text: "MAKE OFFER",
                  backgroundColor: AppColors.lightOrange,
                  borderColor: AppColors.primaryColor,
                  textStyle: CustomTextStyle.t8(AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: AppButton(
                  onPress: () {},
                  text: "SEND MESSAGE",
                  backgroundColor: AppColors.primaryColor,
                  textStyle: CustomTextStyle.t8(Colors.white),
                ),
              ),
            ],
          ),
        ),
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
          title: Row(
            children: [
              SizedBox(
                width: _screeenWidth * 0.5,
                child: Text(
                  "Bánh gạo Hàn Quốc dạng hộp dùng để tặng quà, 4 loại hương vị",
                  style: CustomTextStyle.t1(AppColors.primaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: (() {}),
                child: const Icon(
                  Icons.share,
                  color: AppColors.backIcon,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: _screenHeight * (272 / 844),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: urlImages.length,
                  effect: const SlideEffect(
                      activeDotColor: AppColors.backIcon,
                      dotColor: AppColors.lightGreyColor),
                ),
              ),
              SizedBox(
                height: _screenHeight * (58 / 844),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.info_outline,
                      color: AppColors.backIcon,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: AppColors.backIcon,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Bánh gạo Hàn Quốc dạng hộp dùng để tặng quà, 4 loại hương vị",
                  style: CustomTextStyle.t1(Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "540.000đ",
                  style: CustomTextStyle.h4(AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              InfoProduct(),
              const SizedBox(
                height: 11,
              ),
              Container(
                height: 3,
                color: AppColors.cloadDarkColor,
              ),
              DetailProduct(),
              Container(
                height: 4,
                color: AppColors.cloadDarkColor,
              ),
              InfoSeller(),
              Container(
                height: 4,
                color: AppColors.cloadDarkColor,
              ),
              UserEvaluate(),
              Container(
                height: 4,
                color: AppColors.cloadDarkColor,
              ),
              Column(
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
                                  "Suggestion",
                                  style: CustomTextStyle.h4(Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 220,
                            // child: HorizontalProductListView(
                            //     scrollController: scrollNewProduct),
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
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget TextIcon(IconData icon, String text, int flex, TextStyle textStyle) {
  return Expanded(
    flex: flex,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: AppColors.neutralGrey,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ),
      ],
    ),
  );
}

Widget buildImage(String urlImage, int index) => Container(
      color: Colors.grey,
      child: Image.network(urlImage, fit: BoxFit.cover),
    );
