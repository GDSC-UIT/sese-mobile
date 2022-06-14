import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/values/app_values.dart';
import 'package:sese/app/data/models/MessageModel.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  TextEditingController messageInputController = TextEditingController();
  ScrollController? scrollController = ScrollController();
  RxList<MessageModel> messages = <MessageModel>[].obs;

  bool show = false;
  bool isSend = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;

  @override
  void onInit() async {
    // TODO: implement onInit
    print("chat init");
    var response =
        await HttpService.getRequest(UrlValue.appUrlGetAllConversations);
    print("conversations:${response.body}");
    super.onInit();
  }

  void sendMessage(String message, int sourceId, int targetId) {
    String time = DateTime.now().toString().substring(10, 16);
    socket.emit('message', {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "time": time,
    });
    setMessage("source", message, time);
  }

  // void connect() {
  //   socket =
  //       IO.io("https://secure-sierra-57212.herokuapp.com/", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  //   socket.emit('signin', widget.sourseChat.id);
  //   print(widget.sourseChat.id);
  //   socket.onConnect((_) {
  //     print('connect');
  //     socket.on("message", (msg) {
  //       print("message1 ${msg["message"]}");
  //       setMessage("destination", msg["message"], msg["time"]);
  //     });
  //   });
  // }

  void setMessage(String type, String message, String time) {
    messages.add(MessageModel(type: type, message: message, time: time));
  }
}
