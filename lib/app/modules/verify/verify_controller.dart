import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/core/values/assets.gen.dart';

import '../../routes/app_routes.dart';

class VerifyController extends GetxController {
  Rx<File> image = File(Assets.imagesDoDienTu.path).obs;
  Rx<File> frontImage = File(Assets.imagesDoDienTu.path).obs;
  Rx<File> backImage = File(Assets.imagesDoDienTu.path).obs;
  String typeCard = "";
  late TypeCard typeCardEnum;

  Future getTypeCard() async {
    switch (typeCard) {
      case "thẻ sinh viên":
        {
          typeCardEnum = TypeCard.student_card;
        }
        break;

      case "căn cước công dân":
        {
          typeCardEnum = TypeCard.citizen_identity_card;
        }
        break;

      case "chứng minh nhân dân":
        {
          typeCardEnum = TypeCard.identity_card;
        }
        break;
    }
  }

  Future pickFrontImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      Get.toNamed(AppRoutes.verifyFrontSvSuccess);
      frontImage.value = imageTemp;
    } on PlatformException catch (e) {
      Get.toNamed(AppRoutes.verifyFrontSvFailed);
    }
  }

  Future pickBackImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      Get.toNamed(AppRoutes.verifyBackSvSuccess);
      backImage.value = imageTemp;
    } on PlatformException catch (e) {
      Get.toNamed(AppRoutes.verifyBackSvFailed);
      print('Lấy ảnh không thành công: $e');
    }
  }
}
