import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/modules/home/widgets/bargain_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../core/utils/utils.dart';
import '../widgets/detail_product.dart';
import '../widgets/info_product.dart';
import '../widgets/info_seller.dart';
import '../widgets/share_dialog.dart';
import '../widgets/user_evaluate.dart';

class HomeDetailProductScreen extends StatefulWidget {
  HomeDetailProductScreen({
    Key? key,
  }) : super(key: key);
  final dynamic product = Get.arguments;
  @override
  State<HomeDetailProductScreen> createState() =>
      _HomeDetailProductScreenState();
}

class _HomeDetailProductScreenState extends State<HomeDetailProductScreen> {
  final HomeController homeController = Get.find();
  var isLiked = false.obs;
  int activeIndex = 0;
  ScrollController scrollNewProduct = ScrollController();
  var urlImages = [];
  @override
  void initState() {
    print("product: ${widget.product['images']}");
    urlImages = widget.product['images'];
    super.initState();
  }

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
                  onPress: () {
                    Get.dialog(BargainDialog());
                  },
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
                  onPress: () {
                    Get.toNamed(AppRoutes.chatDetail,
                        arguments: widget.product["user"]);
                  },
                  text: "SEND MESSAGE",
                  backgroundColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
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
                  widget.product["name"],
                  style: CustomTextStyle.t1(AppColors.primaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: (() {
                  Get.dialog(const ShareDialog());
                }),
                child: const Icon(
                  Icons.share,
                  color: AppColors.backIcon,
                  size: 32,
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
                  effect: WormEffect(
                      activeDotColor: AppColors.backIcon,
                      dotColor: AppColors.lightGreyColor.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                height: _screenHeight * (58 / 844),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        isLiked.value = !isLiked.value;
                      },
                      child: Obx(
                        () => (isLiked.value)
                            ? const Icon(
                                Icons.favorite_outlined,
                                color: AppColors.backIcon,
                              )
                            : const Icon(
                                Icons.favorite_border_outlined,
                                color: AppColors.backIcon,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.homeReport);
                      },
                      child: const Icon(
                        Icons.error_outline,
                        color: AppColors.backIcon,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  widget.product["name"],
                  style: CustomTextStyle.t1(Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  num.parse(widget.product["price"].toString()).money("đ"),
                  style: CustomTextStyle.h4(AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              (widget.product != null)
                  ? Column(
                      children: [
                        InfoProduct(
                          product: widget.product,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 8,
                          color: AppColors.cloadDarkColor,
                        ),
                        DetailProduct(product: widget.product),
                        Container(
                          height: 4,
                          color: AppColors.cloadDarkColor,
                        ),
                        InfoSeller(product: widget.product),
                        Container(
                          height: 4,
                          color: AppColors.cloadDarkColor,
                        ),
                        const UserEvaluate(),
                        Container(
                          height: 4,
                          color: AppColors.cloadDarkColor,
                        ),
                      ],
                    )
                  : const SizedBox(),
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
                        const SizedBox(
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
                    ),
                  )
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
      child: Image.network(
        (urlImage != "khong co link") ? urlImage : DataCenter.errorImage,
        fit: BoxFit.cover,
      ),
    );
