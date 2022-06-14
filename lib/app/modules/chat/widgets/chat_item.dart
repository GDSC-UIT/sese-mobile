import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/core/values/assets.gen.dart';

import '../../../core/themes/app_theme.dart';

class ChatItem extends StatelessWidget {
  String name;
  final String avatar;
  String? chatText;
  final String time;
  ChatItem(
      {Key? key,
      required this.name,
      required this.avatar,
      required this.chatText,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    chatText =
        (chatText!.length > 20) ? chatText!.substring(0, 20) + '...' : chatText;
    return ListTile(
        leading: SizedBox(
          width: 64,
          height: 64,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(avatar),
            backgroundColor: AppColors.cloadDarkColor,
          ),
        ),
        title: Text(
          name,
          style: CustomTextStyle.t3(AppColors.darkGreyColor),
        ),
        subtitle: Row(
          children: [
            Text(
              chatText!,
              style: CustomTextStyle.t3(AppColors.darkGreyColor),
            ),
            Text('- ' + time)
          ],
        ));
  }
}
