import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';

class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});
}

class ChatViewmodel extends ChangeNotifier {
  final BuildContext context;
  ChatViewmodel({required this.context});

  List<ChatMessage> messages = [];

  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    final msg = messageController.text.trim();
    if (msg.isEmpty) return;

    messages.add(ChatMessage(text: msg, isMe: true));

    messageController.clear();
    notifyListeners();
  }

  void receiveMessage(String msg) {
    messages.add(ChatMessage(text: msg, isMe: false));
    notifyListeners();
  }

  void showPopUpMenu() {
  showMenu(
    context: context,  
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    position: RelativeRect.fromLTRB(300, 600, 0, 0), 
    items: [
      PopupMenuItem(
        value: "gallery",
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(AssetsPath.gallery),
                SizedBox(width: 5,),
                Text("Gallery", style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: "document",
        child: Row(
          children: [
            SvgPicture.asset(AssetsPath.document),
                  SizedBox(width: 5,),
            Text("Document", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    ],
  );
}

}
