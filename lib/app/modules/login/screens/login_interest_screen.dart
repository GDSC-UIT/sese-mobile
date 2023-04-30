import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

class LoginInterestScreen extends StatelessWidget {
  final LoginController loginController = Get.find();
  final categories = Get.arguments[0];

  LoginInterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    loginController.listOfInterest.value = categories;

    return SafeArea(
      child: Scaffold(
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
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(
                  "I'm interested",
                  style: CustomTextStyle.h1(AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Stack(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio:
                            ((screenWidth * 0.43) / (screenHeight * 0.29)),
                      ),
                      itemCount: loginController.listOfInterest.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(() => InkWell(
                              onTap: () {
                                loginController.toggleSelectInterest(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: loginController.listOfInterest[index]
                                                ['isSelected'] ==
                                            false
                                        ? AppColors.neutralGrey
                                        : AppColors.greenColor,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.36,
                                      height: screenHeight * 0.2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(loginController
                                                    .listOfInterest[index]
                                                ["image"])),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenHeight * 0.02,
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Text(
                                        loginController.listOfInterest[index]
                                                ['name']
                                            .toString()
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: CustomTextStyle.t8(
                                            loginController.listOfInterest[
                                                        index]['isSelected'] ==
                                                    false
                                                ? AppColors.neutralGrey
                                                : AppColors.greenColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ),
              AppButton(
                textStyle: CustomTextStyle.t8(Colors.white),
                onPress: () {
                  Get.toNamed(AppRoutes.authPhone);
                },
                text: 'NEXT',
                backgroundColor: AppColors.primaryColor,
              ),
              SizedBox(
                height: screenHeight * (50 / 846),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
