import 'package:flutter/material.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class SocialViewmodel extends ChangeNotifier {
  SocialViewmodel({required BuildContext context});

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

  void onPostMenuSelected({required String action, required int postIndex}) {
    switch (action) {
      case 'report':
        print("report");
        AppRouter.instance.push(RoutePaths.socialReportPostScreen);
        break;
    }
  }
}
