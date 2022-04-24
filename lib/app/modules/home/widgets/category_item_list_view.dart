import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/modules/home/home_controller.dart';

import '../../../core/values/app_colors.dart';
import '../../../routes/app_routes.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView(
      {Key? key,
      required this.image,
      required this.text,
      required this.homeController})
      : super(key: key);
  final AssetGenImage image;
  final String text;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            homeController.typeScreen = text;
            Get.toNamed(AppRoutes.homeCategory);
          },
          child: Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: AppColors.primaryColor,
                ),
                child: Image(
                  image: image,
                  height: 32,
                  width: 32,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                text,
                style: CustomTextStyle.t2(Colors.black),
              ),
              Expanded(
                child: Container(),
              ),
              Transform.rotate(
                angle: 180 * pi / 180,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.backIcon,
                ),
              ),
              const SizedBox(
                width: 23,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
