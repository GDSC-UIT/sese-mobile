import 'package:flutter/material.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/modules/home/widgets/category_item_list_view.dart';

import '../home_controller.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({Key? key, required this.homeController}) : super(key: key);
  var listCategory = DataCenter.listAppCategory;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CategoryItemListView(
          text: listCategory[index].name,
          icon: listCategory[index].icon,
          homeController: homeController,
        );
      },
      itemCount: listCategory.length,
    );
  }
}
