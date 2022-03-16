import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

class LoginInterestScreen extends StatelessWidget {
  LoginController loginController = Get.find();
  Map<String, AssetGenImage> mapOfInterest = {
    "LÀM ĐẸP": Assets.imagesLamDep,
    'SÁCH': Assets.imagesSach,
    'THỜI TRANG': Assets.imagesThoiTrang,
    'ĐỒ ĐIỆN TỬ': Assets.imagesDoDienTu,
    'GIẢI TRÍ': Assets.imagesGiaiTri,
    'ĐỒ GIA DỤNG': Assets.imagesDoGiaDung
  };

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    List<String> imageName = mapOfInterest.keys.toList();
    List<AssetGenImage> imageUrl = mapOfInterest.values.toList();

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
                  "Mình quan tâm đến",
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
                            ((_screenWidth * 0.43) / (_screenHeight * 0.29)),
                      ),
                      itemCount: mapOfInterest.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.neutralGrey,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: _screenWidth * 0.36,
                                height: _screenHeight * 0.2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageUrl[index],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: _screenHeight * 0.02),
                                child: Text(
                                  imageName[index],
                                  style:
                                      CustomTextStyle.t8(AppColors.neutralGrey),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      left: 0,
                      child: AppButton(
                        textStyle: CustomTextStyle.t8(Colors.white),
                        onPress: () {
                          Get.toNamed(AppRoutes.authPhone);
                        },
                        text: 'TIẾP TỤC NHA',
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
