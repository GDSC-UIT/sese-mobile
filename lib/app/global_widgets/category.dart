import 'package:flutter/material.dart';
import 'package:sese/app/data/models/category_model.dart';
import 'package:sese/app/global_widgets/categoryItem.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

  List<CategoryModel> categoryData = [
    CategoryModel(
      content: 'Sách, tài liệu',
      iconData: Icons.menu_book_outlined,
    ),
    CategoryModel(
      content: 'Đồ điện tử',
      iconData: Icons.lightbulb_outline,
    ),
    CategoryModel(
      content: 'Đồ gia dụng nội thất',
      iconData: Icons.chair_outlined,
    ),
    CategoryModel(
      content: 'Thời trang, trang điểm',
      iconData: Icons.abc,
    ),
    CategoryModel(
      content: 'Thể thao, chơi game, sở thích',
      iconData: Icons.gamepad,
    ),
    CategoryModel(
        content: 'Đồ dùng cá nhân', iconData: Icons.person_outline_outlined),
    CategoryModel(
      content: 'Đồ dùng văn phòng',
      iconData: Icons.my_library_books_outlined,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // return CarouselSlider.builder(

    return SizedBox(
      height: 110,
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
