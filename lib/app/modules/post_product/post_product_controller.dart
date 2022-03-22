import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/data/services/upload_image_service.dart';
import 'package:sese/app/routes/app_routes.dart';

class PostProductController extends GetxController {
  //Rx<File>? image = File('').obs;

  var imageFileList = [].obs;

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
