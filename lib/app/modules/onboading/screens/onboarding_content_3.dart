import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingContent3 extends StatelessWidget {
  OnboardingContent3({Key? key}) : super(key: key);

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 25,
          ),
        ),

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
              Image.asset('assets/images/Sese_enjoyment.png'),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'Kết nối',
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
                  'Liên lạc dễ dàng giữa người bán và người mua để hỏi đáp chi tiết về sản phẩm.',
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
                    text: 'Bắt đầu thôi',
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
