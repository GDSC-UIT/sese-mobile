import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageVerify(Rx<File>? image) {
  return Container(
    height: 262,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      image: DecorationImage(
        image: Image.file(image!.value).image,
        fit: BoxFit.fill,
      ),
    ),
  );
}
