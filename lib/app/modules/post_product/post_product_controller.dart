import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/data/services/upload_image_service.dart';
import 'package:sese/app/routes/app_routes.dart';

class PostProductController extends GetxController {
  //Rx<File>? image = File('').obs;

  //varible to store data
  String idCategory = '';
  String idSubcategory = '';
  var imageFileList = [].obs;
  RxInt quantity = 5.obs;
  //varible to controller input
  var categoryInputController = TextEditingController().obs;
  var subCategoryInputController = TextEditingController().obs;
  var priceInputController = TextEditingController().obs;
  var nameProductInputController = TextEditingController().obs;
  var descriptionProductInputController = TextEditingController().obs;
  var provinceProductLoCationInputController = TextEditingController().obs;
  var districtProductLoCationInputController = TextEditingController().obs;
  var wardsProductLoCationInputController = TextEditingController().obs;

  //variable to check toggle
  var isNegotiable = true.obs;
  var isOpenedCategory = false.obs;
  var isOpenedSubCategory = false.obs;
  //method
  Future pickImage(ImageSource source) async {
    try {
      final imagesTem = await ImagePicker().pickMultiImage();
      List<XFile>? pickedFileList = await ImagePicker().pickMultiImage(
        imageQuality: 5,
      );
      if (!imagesTem!.isNotEmpty) return;
      imageFileList.value = pickedFileList!;
      for (var element in pickedFileList) {
        await UploadImageService.uploadImageToFirebase(
            File(element.path), 'product_images');
      }
      // final imageTemp = File(image.path);

      // frontImage.value = imageTemp;
      // this.image.value = imageTemp;
    } on PlatformException catch (e) {
      print('Lấy ảnh không thành công: $e');
    }
  }
}
