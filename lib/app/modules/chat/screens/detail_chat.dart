import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/data/models/ChatModel.dart';
import 'package:sese/app/modules/chat/widgets/AppBottomSheet.dart';
import 'package:sese/app/modules/chat/widgets/EmojiSelector.dart';
import 'package:sese/app/modules/chat/widgets/OwnMessageCard.dart';
import 'package:sese/app/modules/chat/chat_controller.dart';
import 'package:sese/app/modules/chat/widgets/ReplyCard.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({Key? key, this.chatModel}) : super(key: key);
  final ChatModel? chatModel;
  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  ChatController chatController = Get.find();

  void initState() {
    // TODO: implement initState
    super.initState();
    // connect();
    // focusNode.addListener(() {
    //   if (focusNode.hasFocus) {
    //     setState(() {
    //       show = false;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leadingWidth: 70,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  const SizedBox(
                    width: 8,
                  ),
                  // SvgPicture.asset(
                  //   widget.chatModel!.isGroup == true
                  //       ? "assets/images/group.svg"
                  //       : "assets/images/person.svg",
                  //   width: 30,
                  //   color: Colors.white,
                  // ),
                ],
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Test",

                  ///  widget.chatModel!.name!,
                  style: CustomTextStyle.t2Bold(AppColors.darkGreyColor),
                ),
                Text(
                  "last seen today at 12:05",
                  style: CustomTextStyle.t3(AppColors.darkGreyColor),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.video_call),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
              ),
              PopupMenuButton(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(
                      child: Text("View Contact"),
                      value: "View Contact",
                    ),
                    PopupMenuItem(
                      child: Text("Media, links, and docs"),
                      value: "Media, links, and docs",
                    ),
                    PopupMenuItem(
                      child: Text("Whatapps Web"),
                      value: "Whatapps Web",
                    ),
                    PopupMenuItem(
                      child: Text("Search"),
                      value: "Search",
                    ),
                    PopupMenuItem(
                      child: Text("Mute Notification"),
                      value: "Mute Notification",
                    ),
                    PopupMenuItem(
                      child: Text("Wallpaper"),
                      value: "Wallpaper",
                    ),
                  ];
                },
              ),
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WillPopScope(
              onWillPop: () {
                if (chatController.show) {
                  setState(() {
                    chatController.show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Column(
                children: [
                  //chat view
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        controller: chatController.scrollController,
                        itemCount: chatController.messages.length + 1,
                        itemBuilder: ((context, index) {
                          if (index == chatController.messages.length) {
                            return const SizedBox(
                              height: 70,
                            );
                          }
                          if (chatController.messages[index].type == "source") {
                            return OwnMessageCard(
                              message: chatController.messages[index].message,
                              time: chatController.messages[index].time,
                            );
                          } else if (chatController.messages[index].type ==
                              "destination") {
                            return ReplyCard(
                              message: chatController.messages[index].message,
                              time: chatController.messages[index].time,
                            );
                          }
                          return Container();
                        }),
                      ),
                    ),
                  ),
                  //input text
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      //margin: const EdgeInsets.symmetric(horizontal: 8),
                      margin:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: TextFormField(
                                    controller:
                                        chatController.messageInputController,
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        setState(() {
                                          chatController.isSend = false;
                                        });
                                      } else {
                                        setState(() {
                                          chatController.isSend = true;
                                        });
                                      }
                                    },
                                    focusNode: chatController.focusNode,
                                    maxLines: 5,
                                    minLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      prefixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              chatController.focusNode
                                                  .unfocus();
                                              chatController.focusNode
                                                  .canRequestFocus = false;
                                              chatController.show =
                                                  !chatController.show;
                                            });
                                          },
                                          icon:
                                              const Icon(Icons.emoji_emotions)),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) =>
                                                      const AppBottomSheet());
                                            },
                                            icon: const Icon(Icons.attach_file),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.camera_alt),
                                          ),
                                        ],
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Type here",
                                      contentPadding: const EdgeInsets.all(8),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (chatController.isSend) {
                                    // chatController.sendMessage(
                                    //    chatController.messageInputController.text,
                                    //     widget.sourseChat.id!,
                                    //     widget.chatModel.id!);

                                    // controller!.clear();
                                    // setState(() {
                                    //   isSend = false;
                                    // });
                                    // scrollController!.animateTo(
                                    //   scrollController!
                                    //       .position.maxScrollExtent,
                                    //   duration:
                                    //       const Duration(milliseconds: 300),
                                    //   curve: Curves.easeIn,
                                    // );
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColors.subPrimary,
                                  child: Icon(
                                    chatController.isSend
                                        ? Icons.send
                                        : Icons.mic,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          chatController.show
                              ? const EmojiSelector()
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}
