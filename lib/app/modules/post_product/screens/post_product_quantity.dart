import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';

class PostProductQuantityScreen extends StatelessWidget {
  PostProductQuantityScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text(
                        '0 / 120',
                        style: CustomTextStyle.t2(
                          AppColors.darkGreyColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  InPutTextField(
                      textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                      hintText: 'Nhập giá sản phẩm',
                      isEnable: true,
                      controller: controller)
                ],
              ),
              const SizedBox(height: 48),
              Text(
                'Có thể thương lượng không?',
                style: CustomTextStyle.t2(AppColors.darkGreyColor),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Có',
                    style: CustomTextStyle.t6(AppColors.darkGreyColor),
                  ),
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
