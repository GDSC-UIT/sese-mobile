import 'package:flutter/material.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/global_widgets/categoryItem.dart';

class Category extends StatelessWidget {
  Category({Key? key, required this.scrollController}) : super(key: key);
  ScrollController scrollController = ScrollController();

  List<CategoryModel> categoryData = CategoryModel.createListCategory();
  @override
  Widget build(BuildContext context) {
    // return CarouselSlider.builder(

    return ListView.builder(
      controller: scrollController,
      itemExtent: 90,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryItem(
          content: categoryData[index].content,
          iconData: categoryData[index].iconData,
        );
      },
      itemCount: categoryData.length,
    );
  }
}
