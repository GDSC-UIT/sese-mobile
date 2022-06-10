import 'package:flutter/material.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/modules/home/widgets/category_item.dart';

class ListCategory extends StatelessWidget {
  ListCategory(
      {Key? key, required this.scrollController, required this.homeController})
      : super(key: key);
  ScrollController scrollController;
  HomeController homeController;
  var categoryData = DataCenter.listAppCategory;
  @override
  Widget build(BuildContext context) {
    // return CarouselSlider.builder(

    return ListView.builder(
      controller: scrollController,
      itemExtent: 90,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryItem(
          id: categoryData[index].id,
          content: categoryData[index].name,
          icon: categoryData[index].icon,
          homeController: homeController,
        );
      },
      itemCount: categoryData.length,
    );
  }
}
