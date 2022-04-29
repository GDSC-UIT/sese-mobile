import 'dart:convert';

import 'package:get/get.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/http_service.dart';

class SearchController extends GetxController {
  var listProduct = [].obs;
  var isFirst = true.obs;

  Future searchProducts(String value) async {
    var response =
        await HttpService.getRequest('${UrlValue.appUrlPostProduct}?q=$value');
    listProduct.value = json.decode(response.body)['posts'];
    isFirst.value = false;
    print('list:${listProduct.value}');
  }
}
