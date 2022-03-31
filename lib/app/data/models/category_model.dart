import 'package:flutter/material.dart';
import 'package:sese/app/core/values/assets.gen.dart';

class CategoryModel {
  String content;
  AssetGenImage image;

  CategoryModel({required this.content, required this.image});
  static List<CategoryModel> createListCategory() {
    return [
      CategoryModel(
        content: 'House Appliances',
        image: Assets.imagesHouse,
      ),
      CategoryModel(
        content: 'Fashion, Beauty',
        image: Assets.imagesFashion,
      ),
      CategoryModel(
        content: 'Electronic Devices',
        image: Assets.imagesMonitor,
      ),
      CategoryModel(
        content: 'Sports, Games',
        image: Assets.imagesGame,
      ),
      CategoryModel(
        content: 'Books, References',
        image: Assets.imagesBook,
      ),
      CategoryModel(
        content: 'Stationery',
        image: Assets.imagesMouse,
      ),
    ];
  }
}
