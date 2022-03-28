import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/data/models/product_model.dart';

import '../../../core/values/app_colors.dart';

class HomeDetailProductScreen extends StatelessWidget {
  HomeDetailProductScreen({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    double _screeenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
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
          title: Row(
            children: [
              Text(product.name),
              const SizedBox(
                width: 33,
              ),
              InkWell(
                onTap: (() {}),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: AppColors.primaryColor,
                  size: 40,
                ),
              ),
              Expanded(child: Container()),
              const SizedBox(
                width: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
