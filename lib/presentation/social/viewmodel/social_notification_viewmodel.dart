import 'package:flutter/material.dart';
import 'package:sceneary/core/constants/assets_path.dart';

class SocialNotificationViewmodel extends ChangeNotifier {
  final BuildContext context;

  SocialNotificationViewmodel({required this.context}) {
    fetchNotifications();
  }

  List<Map<String, dynamic>> notifications = [];

  void fetchNotifications() {
    notifications = [
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "connect"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
      {"name": "Arya", "avatar": AssetsPath.men1, "type": "like"},
    ];

    notifyListeners();
  }
}
