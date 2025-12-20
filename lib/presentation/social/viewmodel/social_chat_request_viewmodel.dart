import 'package:flutter/material.dart';

class SocialChatRequestViewmodel extends ChangeNotifier {
  final BuildContext context;

  SocialChatRequestViewmodel({required this.context});

  bool _isSearchVisible = false;

  bool get isSearchVisible => _isSearchVisible;

  void toggleSearch() {
    _isSearchVisible = !_isSearchVisible;
    notifyListeners();
  }

  void hideSearch() {
    _isSearchVisible = false;
    notifyListeners();
  }

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
