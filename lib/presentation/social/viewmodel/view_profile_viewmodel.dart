import 'package:flutter/material.dart';
import 'package:sceneary/core/constants/assets_path.dart';

class ViewProfileViewmodel extends ChangeNotifier {
  final BuildContext context;

  ViewProfileViewmodel({required this.context});

  int selectedTab = 0;

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  final List<Map<String, String>> connections = List.generate(
    14,
    (index) => {"name": "JD ${index + 1}", "image": AssetsPath.women},
  );

  final List<Map<String, dynamic>> posts = [
    {
      'name': 'Arya Stark',
      'caption': 'Winter is coming ❄️',
      'likes': 45,
      'isLiked': false,
      'comments': 45,
      'image': AssetsPath.socialPost,
    },
    {
      'name': 'Jon Snow',
      'caption': 'The North remembers 🐺',
      'likes': 32,
      'isLiked': false,
      'comments': 12,
      'image': AssetsPath.socialPost,
    },
  ];

  void toggleLike(int index) {
    posts[index]['isLiked'] = !posts[index]['isLiked'];
    posts[index]['likes'] += posts[index]['isLiked'] ? 1 : -1;
    notifyListeners();
  }

  void onConnectionMenuSelected({
    required String action,
    required int postIndex,
  }) {
    switch (action) {
      case 'Remove Connection':
        print("Remove Connection");
        break;
      case 'Block':
        print("Block");
        break;
    }
  }

  void onPostMenuSelected({required String action, required int postIndex}) {
    switch (action) {
      case 'Edit':
        print("Edit");
        break;
      case 'Delete':
        print("Delete");
        break;
    }
  }
}
