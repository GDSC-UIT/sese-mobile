import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/global_widgets/app_button.dart';

class LoginInterestScreen extends StatelessWidget {
  // const LoginInterestScreen({Key? key}) : super(key: key);

  // List<Map<String, AssetGenImage>> listInterest = [
  //   {'LÀM ĐẸP': Assets.imagesLamDep},
  //   {'SÁCH': Assets.imagesSach},
  //   {'THỜI TRANG': Assets.imagesThoiTrang},
  //   {'ĐỒ ĐIỆN TỬ': Assets.imagesDoDienTu},
  //   {'GIẢI TRÍ': Assets.imagesGiaiTri},
  //   {'ĐỒ GIA DỤNG': Assets.imagesDoGiaDung}
  // ];

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
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: _screenHeight * 0.05,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.backIcon,
                  size: 30,
                ),
              ),
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
                  alignment: Alignment.center,
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
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  width: _screenWidth * 0.36,
                                  height: _screenHeight * 0.2,
                                  margin: EdgeInsets.only(
                                      top: _screenHeight * 0.02),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageUrl[index],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: _screenHeight * 0.02),
                                  child: Text(
                                    imageName[index],
                                    style: CustomTextStyle.t8(
                                        AppColors.neutralGrey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: Container(
                    //     height: 50,
                    //     child: AppButton(
                    //       onPress: () {},
                    //       text: "Tiep tuc nha",
                    //       textColor: Colors.black,
                    //       backgroundColor: AppColors.primaryColor,
                    //       borderColor: AppColors.primaryColor,
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: _screenHeight * 0.078,
                    //   left: 15,
                    //   child: InkWell(
                    //     onTap: () => {},
                    //     child: Container(
                    //       height: _screenHeight * 0.066,
                    //       width: _screenWidth - 30,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: AppColors.primaryColor,
                    //       ),
                    //       child: Center(
                    //         child: Text(
                    //           "TIẾP TỤC NHA",
                    //           style: TextStyle(
                    //             fontSize: 12,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
