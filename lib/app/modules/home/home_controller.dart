import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/models/category_model.dart';

class HomeController extends GetxController {
  var pageIdx = 0.obs;
  var sliderIdx = 0.obs;
  var seller = TextEditingController().obs;
  var bargainPrice = TextEditingController().obs;

  String typeScreen = "";

  final List<String> listPrice = [
    'Không có',
    'Cao -> thấp',
    'Thấp -> cao',
  ];
  late List<String> listSellerPlace;
  final List<String> listCategory =
      CategoryModel.createListCategory().map((e) => e.content).toList();
  final List<String> listStatus = [
    'Không có',
    'Mới',
    'Cũ',
  ];

  var selectedPriceFilter = "Không có".obs;
  var selectedSellerPlaceFilter = "Không có".obs;
  var selectedCategoryFilter = "Không có".obs;
  var selectedStatusFilter = "Không có".obs;

  RxList<bool> listReportBool = List.filled(7, false).obs;

  void changePage(int index) {
    pageIdx.value = index;
    update();
  }

  void changeSlider(int index) {
    sliderIdx.value = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getList() async {
    var text = await rootBundle.loadString('assets/vietnamese_province.txt');
    listSellerPlace = text.split('\n');
    listSellerPlace.insert(0, "Không có");
  }
}
