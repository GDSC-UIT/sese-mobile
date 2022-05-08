import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingContent1 extends StatelessWidget {
  OnboardingContent1({Key? key}) : super(key: key);

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        actions: [
          TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            child: Text("Skip", style: CustomTextStyle.h3(AppColors.backIcon)),
            onPressed: () {},
          ),
        ],
        // action:
        title: Image.asset('assets/icons/sese_alt_logo.png', height: 35),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Sese_box.png'),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'Share và Sẻ',
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                width: 286.0,
                child: Text(
                  'Đăng, mua, bán, tìm kiếm sản phẩm dễ dàng với hệ thống thông minh.',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.t4(AppColors.neutralGrey),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller: controller, // PageController
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        spacing: 8.0,
                        dotWidth: 19.0,
                        dotHeight: 9.0,
                        dotColor: AppColors.cloadDarkColor,
                        activeDotColor: AppColors.primaryColor,
                      ), // your preferred effect
                      onDotClicked: (index) {}),
                  const SizedBox(
                    width: 64,
                  ),
                  AppButton(
                    onPress: () {},
                    text: 'Tiếp tục',
                    backgroundColor: AppColors.primaryColor,
                    textStyle: CustomTextStyle.t1(Colors.white),
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
