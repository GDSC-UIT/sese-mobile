import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';

class PostProductInfoScreen extends StatelessWidget {
  PostProductInfoScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Thêm sản phẩm',
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
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Tên sản phẩm',
                            style: CustomTextStyle.t2(AppColors.darkGreyColor),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        Text('0/120')
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InPutTextField(
                        textStyle: CustomTextStyle.t6(AppColors.neutralGrey),
                        hintText: 'nhap ten san pham',
                        isEnable: true,
                        controller: controller)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
