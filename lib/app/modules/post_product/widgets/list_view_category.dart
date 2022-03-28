import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';

class ListViewCategory extends StatelessWidget {
  ListViewCategory(
      {Key? key,
      required this.listItem,
      required this.controller,
      required this.type})
      : super(key: key);
  final PostProductController postProductController = Get.find();
  final TextEditingController controller;
  final List<dynamic> listItem;
  final TypeCategory type;
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
              controller.text = listItem[index]['name'];
              if (type == TypeCategory.category) {
                postProductController.idCategory = listItem[index]['_id'];
              } else {
                postProductController.idSubcategory.value =
                    listItem[index]['_id'];
                //get params
                var params = listItem[index]["params"];

                for (var i = 0; i < params.length; i++) {
                  params[i]['controller'] = TextEditingController();
                  params[i]['isOpen'] = false;
                  params[i]['index'] = i;
                  if (params[i]["type"] == "dropdown") {
                    params[i]['paramValue'] = '';
                  }
                }
                postProductController.listParams.value = params;
              }

              postProductController.isOpenedCategory.value = false;
              postProductController.isOpenedSubCategory.value = false;
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                listItem[index]['name'],
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
