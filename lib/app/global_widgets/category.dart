import 'package:flutter/material.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/global_widgets/categoryItem.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

  List<CategoryModel> categoryData = [
    CategoryModel(
      content: 'Dụng cụ học tập',
      iconData: Icons.note_alt,
    ),
    CategoryModel(
      content: 'Điện tử phụ kiện thiết bị',
      iconData: Icons.lightbulb,
    ),
    CategoryModel(
      content: 'Nội thất, vật dụng trang trí',
      iconData: Icons.chair,
    ),
    CategoryModel(
      content: 'Đồ mặc, quần áo',
      iconData: Icons.checkroom,
    ),
    CategoryModel(
      content: 'Giày dép',
      iconData: Icons.ice_skating,
    ),
    CategoryModel(
      content: 'Mỹ phẩm',
      iconData: Icons.vertical_split,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // return CarouselSlider.builder(

    return Container(
      height: 100,
      child: ListView.builder(
        itemExtent: 100,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            content: categoryData[index].content,
            iconData: categoryData[index].iconData,
          );
        },
        itemCount: categoryData.length,
      ),
    );
  }
}
