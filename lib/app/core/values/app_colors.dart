import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  AppColors._();

  //color temporary for home screen
  static const Color mainHomeColor = Color(0xFF739EF1);
  static const Color mainHomeBackGroundColor =
      Color.fromARGB(255, 221, 221, 221);
  static const Color lightGreyColor = Color.fromARGB(255, 138, 138, 138);
  static const Color textHomeColor = Color(0xFF3e4958);

  static const Color cloadDarkColor = Color(0xFFE8EDF1);
  static const Color greenColor = Color(0xFF8FD8B5);
  static const Color darkGreyColor = Color(0xFF190134);
  static const Color primaryColor = Color(0xFFFF6D3B);
  static const Color secondaryColor = Color(0xFF827717);
  static const Color whiteAccentColor = Color(0xffFAFAFA);
  static const Color lightGreenColor = Color(0xffDFF3EA);
  static const Color lightGreen = Color.fromRGBO(223, 243, 234, 1);

  static const Color backIcon = Color.fromRGBO(143, 216, 181, 1);
  static const Color neutralGrey = Color.fromRGBO(179, 171, 188, 1);
  static const Color lightOrange = Color.fromRGBO(255, 239, 234, 1);

  static Color get backgroundColor =>
      (Get.isDarkMode) ? darkBackgroundColor : lightBackgroundColor;

  static Color get textColor =>
      (Get.isDarkMode) ? darkTextColor : lightTextColor;

  static Color get disabledTextColor => (Get.isDarkMode)
      ? darkTextColor.withOpacity(disabledTextOpacity)
      : lightTextColor.withOpacity(disabledTextOpacity);

  static Color get disabledIconColor => (Get.isDarkMode)
      ? darkTextColor.withOpacity(disabledIconOpacity)
      : lightTextColor.withOpacity(disabledIconOpacity);

  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightDeepBackgroundColor = Color(0xFFF0F2F5);
  static const Color lightTextColor = Color(0xFF000000);

  static const Color darkBackgroundColor = Color(0xFF242526);
  static const Color darkDeepBackgroundColor = Color(0xFF18191A);
  static const Color darkTextColor = Color(0xFFFFFFFF);

  static const Color inflowTextColor = Color(0x1E88E5FF);
  static const Color outflowTextColor = Color(0xE53935FF);

  static const double disabledTextOpacity = 0.35;
  static const double disabledIconOpacity = 0.25;
  static Color pieChartExtendedCategoryColor = Colors.grey;
}
