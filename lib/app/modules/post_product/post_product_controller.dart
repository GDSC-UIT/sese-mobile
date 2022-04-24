import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/data/models/product_model.dart';

class PostProductController extends GetxController {
  Rx<ProductModel> productInfo = ProductModel().obs;
  //varible to store data
  String idCategory = '';
  RxString idSubcategory = ''.obs;
  var imageFileList = [].obs;
  RxInt quantity = 1.obs;
  var listParams = [].obs;
  List<String?> listImgProductUrl = [];
  //varible to controller input
  var categoryInputController = TextEditingController();
  var subCategoryInputController = TextEditingController();
  var priceInputController = TextEditingController();
  var nameProductInputController = TextEditingController();
  var descriptionProductInputController = TextEditingController();
  var provinceProductLoCationInputController = TextEditingController();
  var districtProductLoCationInputController = TextEditingController();
  var wardsProductLoCationInputController = TextEditingController();
  var labelPrice = 'Giá'.obs;
  var labelCategory = 'Danh mục'.obs;

  //variable to check toggle
  var isNegotiable = true.obs;
  var isOpenedCategory = false.obs;
  var isOpenedSubCategory = false.obs;
  var isUseDefaultLoca = false.obs;
  //method
  Future pickImage(ImageSource source) async {
    try {
      //final imagesTem = await ImagePicker().pickMultiImage();
      List<XFile>? pickedFileList = await ImagePicker().pickMultiImage();
      if (!pickedFileList!.isNotEmpty) return;
      imageFileList.value = pickedFileList;
    } on PlatformException catch (e) {
      print('Lấy ảnh không thành công: $e');
    }
  }
}
