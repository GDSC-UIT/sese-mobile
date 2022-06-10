import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sese/app/data/services/data_center.dart';

import '../../core/values/app_values.dart';
import '../../data/services/http_service.dart';

class HomeController extends GetxController {
  var pageIdx = 0.obs;
  var sliderIdx = 0.obs;
  var seller = TextEditingController().obs;
  var bargainPrice = TextEditingController().obs;
  var listCategoryProduct = [].obs;

  String typeScreen = "";

  final List<String> listPrice = [
    'Không có',
    'Cao -> thấp',
    'Thấp -> cao',
  ];
  late List<String> listSellerPlace;
  final List<String> listCategory =
      DataCenter.listAppCategory.map((e) => e.name).toList();
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

  Future getListCategoryProduct(String id) async {
    var response = await HttpService.getRequest(
        '${UrlValue.appUrlPostProduct}?category=$id');
    listCategoryProduct.value = json.decode(response.body)['posts'];
  }

  void changePage(int index) {
    pageIdx.value = index;
    update();
  }

  void changeSlider(int index) {
    sliderIdx.value = index;
    update();
  }

  Future<void> getList() async {
    var text = await rootBundle.loadString('assets/vietnamese_province.txt');
    listSellerPlace = text.split('\n');
    listSellerPlace.insert(0, "Không có");
  }
}
