import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class AddPostViewmodel extends ChangeNotifier {
  final BuildContext context;

  AddPostViewmodel({required this.context});

  // ===================== STATE =====================

  bool isLoading = false;

  List<AssetEntity> galleryImages = [];

  /// Selected image indexes
  final Set<int> selectedIndexes = {};

  // ===================== INIT =====================

  Future<void> loadGallery() async {
    isLoading = true;
    notifyListeners();

    final permission = await PhotoManager.requestPermissionExtend();

    if (!permission.isAuth) {
      isLoading = false;
      notifyListeners();
      PhotoManager.openSetting();
      return;
    }

    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      hasAll: true,
    );

    if (albums.isNotEmpty) {
      final AssetPathEntity recentAlbum = albums.first;

      galleryImages = await recentAlbum.getAssetListPaged(page: 0, size: 100);
    }

    isLoading = false;
    notifyListeners();
  }

  // ===================== IMAGE SELECTION =====================

  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
    notifyListeners();
  }

  void clearSelection() {
    selectedIndexes.clear();
    notifyListeners();
  }

  // ===================== ACTION BUTTONS =====================

  void onTextPost() {
    // Navigate to text-only post screen
    AppRouter.instance.push(RoutePaths.addTextScreen);
    debugPrint("Text post tapped");
  }

  Future<void> openCamera() async {
    // Integrate image_picker (camera) here
    debugPrint("Camera tapped");
  }

  Future<void> pickFromGallery() async {
    // Multi-image picker or confirm selected images
    debugPrint("Gallery upload tapped");
  }

  // ===================== HELPERS =====================

  bool get hasSelection => selectedIndexes.isNotEmpty;

  List<AssetEntity> get selectedAssets {
    return selectedIndexes.map((i) => galleryImages[i]).toList();
  }
}
