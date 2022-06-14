// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sese/app/core/themes/app_theme.dart';
// import 'package:sese/app/core/values/assets.gen.dart';
// import 'package:sese/app/global_widgets/input_text_field.dart';
// import 'package:sese/app/modules/chat/chat_controller.dart';

// import '../../../core/values/app_colors.dart';

// class DetailChatScreen extends StatefulWidget {
//   DetailChatScreen({Key? key}) : super(key: key);
//   final dynamic user = Get.arguments;

//   @override
//   State<DetailChatScreen> createState() => _DetailChatScreenState();
// }

// class _DetailChatScreenState extends State<DetailChatScreen> {
//   final chatController = ChatController();
//   int index = 0;
//   String userId1 = '6239390564332ecc32870ac6';

//   String userId2 = '6239392064332ecc32870ad6';

//   List<String> responseMessage = [
//     "Sure. Saturday afternoon would be good - around 15:00 OK?",
//     "Of course! ",
//     "Ok!!!!",
//   ];

//   var listMesage = [];

//   @override
//   Widget build(BuildContext context) {
//     double _screenWidth = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 1,
//           leading: InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: const Icon(
//               Icons.arrow_back_ios_new,
//               color: AppColors.backIcon,
//               size: 30,
//             ),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: 36,
//                 width: 36,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(90),
//                   image: DecorationImage(
//                     //image: Image.network(widget.user['avatar']).image,
//                     image: Image.network(
//                             "https://www.google.com/imgres?imgurl=https%3A%2F%2Fps.w.org%2Fuser-avatar-reloaded%2Fassets%2Ficon-256x256.png%3Frev%3D2540745&imgrefurl=https%3A%2F%2Fvi.wordpress.org%2Fplugins%2Fuser-avatar-reloaded%2F&tbnid=4tCxPvBodOnWbM&vet=12ahUKEwilxNLG5oj4AhXKIaYKHei2BWQQMygBegUIARDZAQ..i&docid=zMWPCB7LhAXYAM&w=257&h=257&q=user%20avatar&ved=2ahUKEwilxNLG5oj4AhXKIaYKHei2BWQQMygBegUIARDZAQ")
//                         .image,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 //widget.user['name'],
//                 "Test",
//                 style: CustomTextStyle.t1(AppColors.primaryColor),
//               ),
//               Expanded(child: Container()),
//               const Icon(
//                 Icons.info_outline,
//                 size: 30,
//                 color: AppColors.primaryColor,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 20, left: 10, top: 10),
//                 child: ListView.separated(
//                   itemCount: listMesage.length,
//                   itemBuilder: (context, index) {
//                     if (listMesage[index]["_id"].toString() == userId1) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             constraints:
//                                 BoxConstraints(maxWidth: _screenWidth * 0.8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: AppColors.backIcon,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 listMesage[index]["text"].toString(),
//                                 style: CustomTextStyle.t6(Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     } else {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           (index > 0 &&
//                                   listMesage[index - 1]["_id"].toString() ==
//                                       userId1)
//                               ? Row(
//                                   children: [
//                                     Container(
//                                       height: 24,
//                                       width: 24,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(90),
//                                         image: const DecorationImage(
//                                           image: Assets.imagesAvatar,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 6,
//                                     ),
//                                   ],
//                                 )
//                               : const SizedBox(
//                                   width: 30,
//                                 ),
//                           Container(
//                             constraints:
//                                 BoxConstraints(maxWidth: _screenWidth * 0.8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: AppColors.messageBoxColor,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 listMesage[index]["text"].toString(),
//                                 style: CustomTextStyle.t6(Colors.black),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     }
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     return const SizedBox(
//                       height: 15,
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const Icon(
//                     Icons.location_on,
//                     color: AppColors.primaryColor,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const Icon(
//                     Icons.camera_alt,
//                     color: AppColors.primaryColor,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   const Icon(
//                     Icons.image,
//                     color: AppColors.primaryColor,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: InPutTextField(
//                       hintText: "Send message",
//                       controller: chatController.messageController,
//                       isEnable: true,
//                       suffixIcon: const Icon(
//                         Icons.emoji_emotions,
//                         size: 20,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       print(chatController.messageController.text);
//                       setState(() {
//                         listMesage.add({
//                           "_id": userId1,
//                           "text": chatController.messageController.text,
//                         });
//                         Future.delayed(
//                           const Duration(milliseconds: 500),
//                           () {
//                             print('response');
//                             setState(() {
//                               listMesage.add(
//                                 {
//                                   "_id": userId2,
//                                   "text": responseMessage[index],
//                                 },
//                               );
//                               index++;
//                             });
//                           },
//                         );

//                         chatController.messageController.text = '';
//                       });
//                     },
//                     child: const Icon(
//                       Icons.send,
//                       color: AppColors.primaryColor,
//                       size: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
