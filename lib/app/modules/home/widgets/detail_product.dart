import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sese/app/data/models/sub_category.dart';
import 'package:sese/app/data/services/data_center.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key, required this.product}) : super(key: key);
  final dynamic product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    String catergory = widget.product["category"];
    SubCategory subCategory = DataCenter.appSubCategory[catergory]!;
    List<dynamic> properties = subCategory.params.values.toList();
    Map<String, dynamic> params = widget.product["categoryParams"];
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                "Product Details",
                style: CustomTextStyle.h4(Colors.black),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < properties.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          properties[i]["label"],
                          style: CustomTextStyle.t8(AppColors.lightGrey),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < properties.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          params[properties[i]["_id"]],
                          style: CustomTextStyle.t8(Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            width: double.infinity,
            height: screenHeight * (109 / 1000),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.lightGreyColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                widget.product["note"],
                style: CustomTextStyle.t6(AppColors.darkGreyColor),
              ),
            ),
          ),
        ),
        Container(
          height: 4,
          color: AppColors.cloadDarkColor,
        ),
        SizedBox(
          height: 37,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "View more",
                style: CustomTextStyle.t8(AppColors.primaryColor),
              ),
              const SizedBox(
                width: 9,
              ),
              Transform.rotate(
                angle: -90 * pi / 180,
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

Widget textIcon(IconData icon, String text, int flex, TextStyle textStyle) {
  return Expanded(
    flex: flex,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: AppColors.neutralGrey,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ),
      ],
    ),
  );
}
