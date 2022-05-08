import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/onboading/onboading_controller.dart';
import 'package:sese/app/modules/onboading/widgets/content.dart';
import 'package:sese/app/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboadingContent extends StatelessWidget {
  OnboadingContent({Key? key}) : super(key: key);
  PageController controller = PageController();
  List contents = [
    Content(
        imagePath: 'assets/images/Sese_box.png',
        title: 'Share và Sẻ',
        description:
            'Đăng, mua, bán, tìm kiếm sản phẩm dễ dàng với hệ thống thông minh.'),
    Content(
        imagePath: 'assets/images/Sese_suspicious.png',
        title: 'Tin cậy',
        description:
            'Giao dịch, mua bán an toàn, uy tín với những tài khoản đã được xác thực.'),
    Content(
        imagePath: 'assets/images/Sese_enjoyment.png',
        title: 'Kết nối',
        description:
            'Liên lạc dễ dàng giữa người bán và người mua để hỏi đáp chi tiết về sản phẩm.'),
  ];

  OnboadingController onboadingController = Get.find();
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
              Obx(
                () => contents[onboadingController.index.value],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => AnimatedSmoothIndicator(
                      activeIndex: onboadingController.index.value,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        spacing: 8.0,
                        dotWidth: 19.0,
                        dotHeight: 9.0,
                        dotColor: AppColors.cloadDarkColor,
                        activeDotColor: AppColors.primaryColor,
                      ), // your preferred effect
                      onDotClicked: (index) {
                        onboadingController.index.value = index;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 64,
                  ),
                  AppButton(
                    onPress: () {
                      if (onboadingController.index.value < 2) {
                        onboadingController.index.value++;
                      } else {
                        Get.offAllNamed(AppRoutes.authBegin);
                      }
                      print(onboadingController.index.value);
                    },
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
