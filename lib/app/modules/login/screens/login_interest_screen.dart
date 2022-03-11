import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';

class LoginInterestScreen extends StatelessWidget {
  // const LoginInterestScreen({Key? key}) : super(key: key);

  List<Map<String, String>> listInterest = [
    {'Noodle': "Images.ingre1"},
    {'Shrimp': "Images.ingre2"},
    {'Egg': "Images.ingre3"},
    {'Scallion': "Images.ingre4"}
  ];

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: _screenHeight * 0.08, left: _screenWidth * 0.07),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.backIcon,
              size: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Text(
              "Mình quan tâm đến",
              style: TextStyle(
                fontSize: 32,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio:
                          ((_screenWidth * 0.43) / (_screenHeight * 0.27)),
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(5),
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
                                color: Colors.red,
                                margin:
                                    EdgeInsets.only(top: _screenHeight * 0.02),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: _screenHeight * 0.02),
                                child: const Text(
                                  "ĐỒ ĐIỆN TỬ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.neutralGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
    );
  }
}
