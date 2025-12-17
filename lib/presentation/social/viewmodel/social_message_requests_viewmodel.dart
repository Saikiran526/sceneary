import 'package:flutter/material.dart';
import 'package:sceneary/core/constants/assets_path.dart';

class SocialMessageRequestsViewmodel extends ChangeNotifier {
final BuildContext context;

SocialMessageRequestsViewmodel({required this.context});

  final List<Map<String, dynamic>> chats = List.generate(
    12,
    (index) => {
      "name": "Arya Stark ${index + 1}",
      "lastMessage": "Hey, are you coming today?",
      "unread": 3,
      "date": "12/11/2025",
      "image": AssetsPath.women,
    },
  );

}