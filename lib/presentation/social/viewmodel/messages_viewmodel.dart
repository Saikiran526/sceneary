import 'package:flutter/material.dart';
import 'package:sceneary/core/constants/assets_path.dart';

class SocialMessagesViewmodel extends ChangeNotifier {
  final BuildContext context;

  SocialMessagesViewmodel({required this.context});

  final List<Map<String, dynamic>> chats = List.generate(
    12,
    (index) => {
      "name": "Arya Stark ${index + 1}",
      "lastMessage": "Hey, are you coming today?",
      "unread": index % 3 == 0 ? 0 : (index + 1),
      "date": "12/11/2025",
      "image": AssetsPath.women,
    },
  );
}
