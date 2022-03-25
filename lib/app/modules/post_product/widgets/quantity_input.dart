import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';

class QuantityInput extends StatelessWidget {
  QuantityInput({Key? key}) : super(key: key);

  PostProductController postProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      style: CustomTextStyle.t2(AppColors.darkGreyColor),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
        prefixIcon: Image.asset(
          'assets/icons/Shopping_Bag_01.png',
        ),
        suffixIcon: InkWell(
          onTap: () {
            print('click row');
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  print('click');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.cloadDarkColor,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Text(
                    '+',
                    style: CustomTextStyle.t8(AppColors.darkGreyColor),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              // Obx(() => Text('${postProductController.quantity.value}')),
              Text('${postProductController.quantity.value}'),
              const SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  HttpService.showLoadingIndecator();
                  print('click');
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.cloadDarkColor,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  margin: const EdgeInsets.only(right: 12),
                  child: Text(
                    '-',
                    style: CustomTextStyle.t8(AppColors.darkGreyColor),
                  ),
                ),
              )
            ],
          ),
        ),
        // prefixIcon: prefixicon,
        hintText: 'Số lượng',
        hintStyle: CustomTextStyle.t2(AppColors.darkGreyColor),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greenColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
