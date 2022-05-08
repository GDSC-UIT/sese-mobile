import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/home/home_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../global_widgets/input_text_field.dart';

class BargainDialog extends StatelessWidget {
  BargainDialog({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  color: AppColors.backIcon,
                  width: 1,
                ),
              ),
              backgroundColor: Colors.white,
              title: SizedBox(
                height: 400,
                width: 350,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          const Center(
                            child: Image(
                              image: Assets.imagesTraGia,
                              height: 162,
                              width: 100,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: (() {
                                Get.back();
                              }),
                              child: const Icon(
                                Icons.close,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Trả giá sản phẩm",
                      style: CustomTextStyle.h4(AppColors.darkGreyColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Nhập giá tiền mà bạn muốn mua ",
                          style: CustomTextStyle.t6(AppColors.darkGreyColor),
                        ),
                        Column(
                          children: [
                            Text(
                              '*',
                              style: CustomTextStyle.t6(AppColors.primaryColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InPutTextField(
                      hintText: "540.000đ",
                      isEnable: true,
                      controller: homeController.bargainPrice.value,
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      typeKeyBoard: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton(
                      onPress: () {},
                      text: "GỬI",
                      textStyle: CustomTextStyle.t8(Colors.white),
                      backgroundColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
