import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/data/services/upload_image_service.dart';
import 'package:sese/app/modules/verify/widgets/dialog_success.dart';

import '../../routes/app_routes.dart';

class VerifyController extends GetxController {
  Rx<File> image = File(Assets.imagesCalendarIcon.path).obs;
  Rx<File> frontImage = File(Assets.imagesDoDienTu.path).obs;
  Rx<File> backImage = File(Assets.imagesDoDienTu.path).obs;
  String frontImageUrl = '';
  String backImageUrl = '';

  String typeCard = "";
  late TypeCard typeCardEnum;

  Future getTypeCard() async {
    switch (typeCard) {
      case "student card":
        {
          typeCardEnum = TypeCard.student_card;
        }
        break;

      case "citizen identity card":
        {
          typeCardEnum = TypeCard.citizen_identity_card;
        }
        break;

      case "identity card":
        {
          typeCardEnum = TypeCard.identity_card;
        }
        break;
    }
  }

  Future pickFrontImage(ImageSource source) async {
    try {
      print("font");
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      Get.toNamed(AppRoutes.verifyFrontSvSuccess);
      frontImage.value = imageTemp;
    } on PlatformException catch (e) {
      print('Lấy ảnh không thành công: $e');
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

  Future addEvidence() async {
    try {
      //up image to firebase to get imgUrl
      frontImageUrl = (await UploadImageService.uploadImageToFirebase(
          File(frontImage.value.path), "verify_images"))!;
      print('frontImg:${frontImageUrl}');

      backImageUrl = (await UploadImageService.uploadImageToFirebase(
          File(backImage.value.path), "verify_images"))!;
      print('backImg:${backImageUrl}');

      //tranfer type of card
      String typeCard = '';
      if (typeCardEnum == TypeCard.citizen_identity_card) {
        typeCard = 'citizen_identity_card';
      } else {
        if (typeCardEnum == TypeCard.identity_card) {
          typeCard = 'identity_card';
        } else {
          typeCard = 'student_card';
        }
      }
      //evidence info
      Map<String, dynamic> userVerifyInfo = {
        'evidence': {
          "type": typeCard,
          "frontImg": frontImageUrl,
          "backImg": backImageUrl,
        }
      };
      print(userVerifyInfo);
      var response = await HttpService.putRequest(
        body: jsonEncode(
          userVerifyInfo,
        ),
        url: UrlValue.appUrlVerifyUser,
      );
      print("response:${response.body}");
    } catch (e) {
      Get.snackbar('', 'Error occur when verify!, Please try again');
      print("error $e");
    }
  }
}
