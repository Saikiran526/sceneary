import 'package:flutter/material.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/social/model/commemt_model.dart';
import 'package:sceneary/presentation/social/model/like_model.dart';

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
        AppRouter.instance.push(RoutePaths.socialReportPostScreen);
        break;
    }
  }

  final List<LikeUser> likes = [
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
    LikeUser(name: "John Doe", isConnected: false),
    LikeUser(name: "Jane Smith", isConnected: true),
  ];

  final TextEditingController commentController = TextEditingController();

  final List<CommentModel> comments = [
    CommentModel(
      name: "John Doe",
      avatar: "https://i.pravatar.cc/150",
      text: "Nice post 🔥",
      time: "2h",
    ),
    CommentModel(
      name: "John Doe",
      avatar: "https://i.pravatar.cc/150",
      text: "Nice post 🔥",
      time: "2h",
    ),
    CommentModel(
      name: "John Doe",
      avatar: "https://i.pravatar.cc/150",
      text: "Nice post 🔥",
      time: "2h",
    ),
    CommentModel(
      name: "John Doe",
      avatar: "https://i.pravatar.cc/150",
      text: "Nice post 🔥",
      time: "2h",
    ),
    CommentModel(
      name: "John Doe",
      avatar: "https://i.pravatar.cc/150",
      text: "Nice post 🔥",
      time: "2h",
    ),
  ];
  void addComment() {
    if (commentController.text.trim().isEmpty) return;

    comments.add(
      CommentModel(
        name: "You",
        avatar: "https://i.pravatar.cc/151",
        text: commentController.text,
        time: "Now",
      ),
    );

    commentController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
