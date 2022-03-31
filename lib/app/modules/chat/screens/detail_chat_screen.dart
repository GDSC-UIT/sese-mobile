import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/values/assets.gen.dart';

import '../../../core/values/app_colors.dart';

class DetailChatScreen extends StatelessWidget {
  DetailChatScreen({Key? key}) : super(key: key);
  String userId1 = '6239390564332ecc32870ac6';
  var listMesage = [
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "Xin chào bạn nhớ",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "Cool",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "anh ngu chua",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.backIcon,
              size: 30,
            ),
          ),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: Assets.imagesAvatar),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
