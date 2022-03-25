import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/app_check_box.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';

class PostProductPriceScreen extends StatelessWidget {
  PostProductPriceScreen({Key? key}) : super(key: key);
  PostProductController postProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Giá sản phẩm',
          style: CustomTextStyle.h4(AppColors.primaryColor),
        ),
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
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Gía sản phẩm ',
                    style: CustomTextStyle.t2(AppColors.darkGreyColor),
                    children: const <TextSpan>[
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InPutTextField(
                    typeKeyBoard: TextInputType.number,
                    textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                    hintText: 'Nhập giá sản phẩm',
                    isEnable: true,
                    controller:
                        postProductController.priceInputController.value)
              ],
            ),
            const SizedBox(height: 48),
            Text(
              'Có thể thương lượng không?',
              style: CustomTextStyle.t2(AppColors.darkGreyColor),
            ),
            const SizedBox(height: 20),
            Obx(
              () => AppCheckBox(
                textOptionString: 'Có',
                onPress: () {
                  print('click');
                  postProductController.isNegotiable.value =
                      !postProductController.isNegotiable.value;
                },
                isSelected:
                    postProductController.isNegotiable == true ? true : false,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => AppCheckBox(
                textOptionString: 'Không',
                onPress: () {
                  postProductController.isNegotiable.value =
                      !postProductController.isNegotiable.value;
                },
                isSelected:
                    postProductController.isNegotiable == false ? true : false,
              ),
            ),
            const SizedBox(height: 48),
            AppButton(
              onPress: () {},
              text: 'Xong',
              backgroundColor: AppColors.primaryColor,
              textStyle: CustomTextStyle.t8(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
