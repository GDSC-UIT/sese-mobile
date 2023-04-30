import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';

class ListViewParams extends StatelessWidget {
  final PostProductController postProductController = Get.find();
  ListViewParams(
      {Key? key,
      required this.listItem,
      required this.controller,
      required this.idx})
      : super(key: key);

  final TextEditingController controller;
  final List<dynamic> listItem;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGreen),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: 150,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.text = listItem[index]['label'];
              //get id of param
              postProductController.listParams[idx]["paramValue"] =
                  listItem[index]["_id"];
              //toggle list view
              var temp = postProductController.listParams[idx];
              temp["isOpen"] = !temp["isOpen"];
              postProductController.listParams[idx] = temp;
              log(postProductController.listParams[idx]);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                listItem[index]['label'],
                style: CustomTextStyle.t6(AppColors.neutralGrey),
              ),
            ),
          );
        },
        itemCount: listItem.length,
      ),
    );
  }
}
