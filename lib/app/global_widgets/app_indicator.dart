import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    Key? key,
    required this.sliderLength,
    required this.sliderController,
    required this.activeIndex,
  }) : super(key: key);

  // final HomeController homeController;
  final CarouselController sliderController;
  final int sliderLength;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      count: sliderLength,
      activeIndex: activeIndex,
      effect: const WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Colors.white,
        dotColor: Color.fromARGB(255, 182, 182, 182),
      ),
    );
  }
}
