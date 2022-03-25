import 'package:flutter/material.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/global_widgets/categoryItem.dart';
import 'package:sese/app/modules/home/widgets/category_item_list_view.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({Key? key}) : super(key: key);
  final List<CategoryModel> listCategory = CategoryModel.createListCategory();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CategoryItemListView(
          text: listCategory[index].content,
          icon: listCategory[index].iconData,
        );
      },
      itemCount: listCategory.length,
    );
  }
}
