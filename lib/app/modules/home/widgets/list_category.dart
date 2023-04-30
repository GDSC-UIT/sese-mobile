import 'package:flutter/material.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/modules/home/widgets/category_item.dart';

class ListCategory extends StatelessWidget {
  ListCategory(
      {Key? key, required this.scrollController, required this.homeController})
      : super(key: key);
  final ScrollController scrollController;
  final HomeController homeController;
  final List<CategoryModel> categoryData = CategoryModel.createListCategory();
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
          image: categoryData[index].image,
          homeController: homeController,
        );
      },
      itemCount: categoryData.length,
    );
  }
}
