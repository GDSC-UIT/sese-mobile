import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/modules/home/widgets/image_banner.dart';

class SliderBanner extends StatelessWidget {
  final sliderController;
  final double headerHeight;
  SliderBanner(
      {Key? key, required this.sliderController, required this.headerHeight})
      : super(key: key);
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: homeController.sliderImages.length,
      itemBuilder: (context, index, realIndex) {
        return ImageBanner(urlImage: homeController.sliderImages[index]);
      },
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        initialPage: 0,
        onPageChanged: (int index, reason) {
          homeController.changeSlider(index);
        },
        height: headerHeight * 0.5,
      ),
      carouselController: sliderController,
    );
  }
}
