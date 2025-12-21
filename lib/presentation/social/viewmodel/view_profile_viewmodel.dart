import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      showDeletePostDialog(context);

        print("Delete");
        break;
    }
  }


  void showDeletePostDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// TEXT
              Text(
                "Are you sure want delete the post",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.0, // line-height: 100%
                  letterSpacing: 0,
                  color: const Color(0xFF3D3D3D),
                ),
              ),

              const SizedBox(height: 16),

              /// BUTTONS
              Row(
                children: [
                  /// CANCEL
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0XFF5D5D5D),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF1D55A8),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// DELETE
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                       },
                      child: Container(
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0XFFC33330),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Delete",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
}
