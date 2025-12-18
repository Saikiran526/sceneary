import 'package:flutter/material.dart';

class SocialChatViewmodel extends ChangeNotifier {
  final BuildContext context;

  SocialChatViewmodel({required this.context});

  void onChatMenuSelected({required String action}) {
    switch (action) {
      case 'Block':
        print("Block");
        break;
      case 'muteNotifications':
        print("Mute Notifications");
    }
  }
}
