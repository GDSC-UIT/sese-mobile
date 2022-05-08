import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

class LoginBeginScreen extends StatelessWidget {
  LoginBeginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    print('isLogin: ${AuthService.instance.isLogined}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Start buying, selling, and exchanging with Se Sẻ now!',
                    style: CustomTextStyle.h1(AppColors.primaryColor),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Image.asset('assets/images/login_begin_img.png'),
                // child: Container(),
              ),
              AppButton(
                textStyle: CustomTextStyle.t8(AppColors.darkGreyColor),
                onPress: () async {
                  //show loader when login
                  HttpService.showLoadingIndecator();
                  //login
                  await loginController.googleSignInAction();

                  AuthService.instance.isLogined == true
                      ? Get.offNamed(AppRoutes.authName)
                      : print('Login gg fail');
                },
                text: 'LOGIN WITH GOOGLE',
                // textColor: AppColors.darkGreyColor,
                borderColor: AppColors.greenColor,
                icon: Assets.imagesGoogleIcon.image(),
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                textStyle: CustomTextStyle.t8(AppColors.darkGreyColor),
                onPress: () async {
                  //show loader when login
                  HttpService.showLoadingIndecator();
                  //login
                  await loginController.facebookLoginAction();
                  AuthService.instance.isLogined == true
                      ? Get.offNamed(AppRoutes.authName)
                      : print('Login facebook fail');
                },
                text: 'LOGIN WITH FACEBOOK',
                // textColor: AppColors.darkGreyColor,
                borderColor: AppColors.greenColor,
                icon: Assets.imagesFacebookIcon.image(),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
