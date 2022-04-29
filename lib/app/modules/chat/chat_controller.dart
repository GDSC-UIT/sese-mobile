import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/services/http_service.dart';

class ChatController extends GetxController {
  var messageController = TextEditingController();
  @override
  void onInit() async {
    // TODO: implement onInit
    print("chat init");
    var response =
        await HttpService.getRequest(UrlValue.appUrlGetAllConversations);
    print("conversations:${response.body}");
    super.onInit();
  }
}
