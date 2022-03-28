import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/data/services/auth_service.dart';

class HttpService {
  static Future<http.Response> postRequest({body, url}) async {
    return await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AuthService.instance.accessToken}',
        },
        body: body);
  }

  static Future<http.Response> putRequest({body, url}) async {
    return await http.put(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AuthService.instance.accessToken}',
        },
        body: body);
  }

  static Future<http.Response> getRequest(url) async {
    return await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${AuthService.instance.accessToken}',
      },
    );
  }

  static showLoadingIndecator() {
    Get.defaultDialog(
        title: 'Loading...',
        content: const CircularProgressIndicator(
          color: AppColors.primaryColor,
          backgroundColor: AppColors.cloadDarkColor,
        ));
  }
}
