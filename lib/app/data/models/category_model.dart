import 'package:flutter/material.dart';

class CategoryModel {
  String content;
  IconData iconData;

  CategoryModel({required this.content, required this.iconData});
  static List<CategoryModel> createListCategory() {
    return [
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
        iconData: Icons.abc_rounded,
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
  }
}
