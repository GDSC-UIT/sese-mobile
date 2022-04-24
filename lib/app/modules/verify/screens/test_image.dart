import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/modules/verify/verify_controller.dart';

class TestImage extends StatelessWidget {
  VerifyController verifyController = Get.find();

  TestImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.file(
            verifyController.frontImage.value,
            height: 200,
            width: 500,
          ),
          Image.file(
            verifyController.backImage.value,
            height: 200,
            width: 500,
          ),
        ],
      ),
    );
  }
}
