import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/chat/chat_controller.dart';
import 'package:sese/app/modules/chat/widgets/chat_item.dart';
import 'package:sese/app/routes/app_routes.dart';

class AllChatScreen extends StatelessWidget {
  AllChatScreen({Key? key}) : super(key: key);
  ChatController chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Tin nhắn (3 tin nhắn mới)",
            style: CustomTextStyle.t1(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      'http://images5.fanpop.com/image/photos/24800000/Pusheen-pusheen-the-cat-24896681-350-328.gif'),
                  backgroundColor: AppColors.cloadDarkColor,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: InPutTextField(
                    prefixicon: const Icon(
                      Icons.search,
                      color: AppColors.greenColor,
                    ),
                    textStyle: CustomTextStyle.t6(AppColors.darkGreyColor),
                    hintText: 'Tìm kiếm',
                    isEnable: true,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.chatDetail);
                    },
                    child: ChatItem(
                        name: "Khanh Linh",
                        avatar:
                            'http://images5.fanpop.com/image/photos/24800000/Pusheen-pusheen-the-cat-24896681-350-328.gif',
                        chatText: "Heluuufjndjnfjnjnfjanjnajndjnajnjannf",
                        time: "22:03"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
