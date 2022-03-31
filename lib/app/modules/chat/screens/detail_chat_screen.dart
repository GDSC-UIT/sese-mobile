import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/chat/chat_controller.dart';

import '../../../core/values/app_colors.dart';

class DetailChatScreen extends StatelessWidget {
  DetailChatScreen({Key? key}) : super(key: key);
  final chatController = ChatController();
  String userId1 = '6239390564332ecc32870ac6';
  String userId2 = '6239392064332ecc32870ad6';
  var listMesage = [
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "Hello",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text":
          "hello. How can iqwerwqrqwrqewrqewrqwerqewrwqerqwerqwerqewrqewrqewrwe do for you?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text":
          "I commented on Figma, i want to add some fancy icons. Do you have any icon set?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "I am in a process of designing some. When do you need them?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "Next month?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "I am in a process of designing some. When do you need them?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "maciej.kowalski@email.com",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "maciej.kowalski@email.com",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "maciej.kowalski@emaiqwerwqrqewrqwererwl.com",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "Hello",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "hello. How can i do for you?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text":
          "I commented on Figma, i want to add some fancy icons. Do you have any icon set?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "I am in a process of designing some. When do you need them?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "Next month?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "I am in a process of designing some. When do you need them?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239390564332ecc32870ac6",
      "text": "?",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:48:37.479Z",
      "updatedAt": "2022-03-22T02:48:37.479Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "maciej.kowalski@email.com",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "maciej.kowalski@email.com",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
    {
      "_id": "6239392064332ecc32870ad6",
      "text": "maciej.kowalski@emaiqwerwqrqewrqwererwl.com",
      "sender": "620761009fe4c5f3e879343f",
      "conversation": "6239390564332ecc32870ac5",
      "createdAt": "2022-03-22T02:49:04.678Z",
      "updatedAt": "2022-03-22T02:49:04.678Z",
      "__v": 0
    },
  ];
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  image: const DecorationImage(
                    image: Assets.imagesAvatar,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Ba Duong",
                style: CustomTextStyle.t1(AppColors.primaryColor),
              ),
              Expanded(child: Container()),
              const Icon(
                Icons.info_outline,
                size: 30,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.primaryColor,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.camera_alt,
                color: AppColors.primaryColor,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.image,
                color: AppColors.primaryColor,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: InPutTextField(
                  hintText: "Send message",
                  controller: chatController.message,
                  isEnable: true,
                  suffixIcon: const Icon(
                    Icons.emoji_emotions,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.send,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 10, top: 10),
          child: ListView.separated(
            itemCount: listMesage.length,
            itemBuilder: (context, index) {
              if (listMesage[index]["_id"].toString() == userId1) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: _screenWidth * 0.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.backIcon,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listMesage[index]["text"].toString(),
                          style: CustomTextStyle.t6(Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (index > 0 &&
                            listMesage[index - 1]["_id"].toString() == userId1)
                        ? Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  image: const DecorationImage(
                                    image: Assets.imagesAvatar,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                            ],
                          )
                        : const SizedBox(
                            width: 30,
                          ),
                    Container(
                      constraints: BoxConstraints(maxWidth: _screenWidth * 0.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.messageBoxColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listMesage[index]["text"].toString(),
                          style: CustomTextStyle.t6(Colors.black),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15,
              );
            },
          ),
        ),
      ),
    );
  }
}
