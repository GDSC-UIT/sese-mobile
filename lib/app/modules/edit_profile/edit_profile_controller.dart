import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:sese/app/data/services/upload_image_service.dart';

import '../../routes/app_routes.dart';

class EditProfileController extends GetxController {
  RxBool genderCheckbox = false.obs;
  String avatarUrl = '';
  Rx<File> image = File(Assets.imagesCalendarIcon.path).obs;
  Rx<File> avatar = File(Assets.imagesAvatar.path).obs;

  var nameInputController = TextEditingController().obs;
  var schoolInputController = TextEditingController().obs;
  var dateInputController = TextEditingController().obs;
  var emailInputController = TextEditingController().obs;
  var phoneNumberInputController = TextEditingController().obs;
  RxString name = "${DataCenter.user["name"]}".obs;
  RxString email = "${DataCenter.user["email"]}".obs;
  RxString birthDate = "${DataCenter.user["birthDate"]}".obs;
  RxString gender = "${DataCenter.user["gender"]}".obs;
  RxString university = "${DataCenter.user["university"]}".obs;
  RxString phoneNumber = "${DataCenter.user["phoneNumber"]}".obs;
  RxBool isMale =
      "${DataCenter.user["gender"]}" == "male" ? true.obs : false.obs;
  var recommendUniName = [].obs;
  var saveSuccess = false.obs;

  List<String> universityName = [
    'Đại học bách khoa',
    'Đại học khoa học tự nhiên',
    'Đại học công nghệ thông tin',
    'Đại học quốc tế',
    'Đại học sư phạm kĩ thuật'
  ];

  RxString searchKey = ''.obs;

  void updateGender() {
    isMale.value == true ? gender.value = "male" : gender.value = "female";
  }

  void searchSchool() {
    recommendUniName.value = universityName.where((element) {
      return element.contains(searchKey);
    }).toList();
  }

  Future<void> datePicker(context) async {
    DateFormat formatter = DateFormat('dd/MM/yyyy');

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(2022, 12, 30),
    );
    if (picked != null && picked != DateTime.now()) {
      dateInputController.value.value =
          TextEditingValue(text: formatter.format(picked));
    }
  }

  Future pickAvatarFromGallery(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image.value = imageTemp;
      print("Avatar path heluuuuu: " + avatar.value.path);
      Get.toNamed(AppRoutes.editUserProfile);
      avatar.value = imageTemp;
    } on PlatformException catch (e) {
      print('Lấy ảnh không thành công: $e');
      Get.toNamed(AppRoutes.editUserProfile);
    }
  }

  Future addAvatar() async {
    try {
      print("avata value path: ${avatar.value.path}");
      //up image to firebase to get imgUrl
      avatarUrl = (await UploadImageService.uploadImageToFirebase(
          File(avatar.value.path), "avatar_image"))!;
      print('avatar url:${avatarUrl}');

      Map<String, dynamic> userAvatar = {"avatar_image": avatarUrl};
      var response = await HttpService.putRequest(
        body: jsonEncode(userAvatar),
        url: UrlValue.appUrlUpdateUserProfile,
      );
    } catch (e) {
      Get.snackbar('', 'Please try again');
      print("error $e");
    }
  }
}
