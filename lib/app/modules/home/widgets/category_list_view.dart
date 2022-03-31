import 'package:flutter/material.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/modules/home/widgets/category_item_list_view.dart';

import '../home_controller.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({Key? key, required this.homeController}) : super(key: key);
  final List<CategoryModel> listCategory = CategoryModel.createListCategory();
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CategoryItemListView(
          text: listCategory[index].content,
          image: listCategory[index].image,
          homeController: homeController,
        );
      },
      itemCount: listCategory.length,
    );
  }
}
