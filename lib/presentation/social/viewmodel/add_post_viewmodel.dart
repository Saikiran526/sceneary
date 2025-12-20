import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostViewmodel extends ChangeNotifier {
  final BuildContext context;

  AddPostViewmodel({required this.context}) {
    loadGallery();
  }

  // for gallery

  // List<AssetEntity> galleryImages = [];
  // bool isLoading = true;

  // Future<void> loadGallery() async {
  //   final permission = await PhotoManager.requestPermissionExtend();
  //   if (!permission.isAuth) return;

  //   final albums = await PhotoManager.getAssetPathList(
  //     type: RequestType.image,
  //     onlyAll: true,
  //   );

  //   final recentAlbum = albums.first;

  //   galleryImages = await recentAlbum.getAssetListPaged(page: 0, size: 60);

  //   isLoading = false;
  //   notifyListeners();
  // }
  List<AssetEntity> galleryImages = [];
  bool isLoading = true;

  Future<void> loadGallery() async {
    isLoading = true;
    notifyListeners();

    final permission = await PhotoManager.requestPermissionExtend();

    // ✅ Allow both full & limited access (IMPORTANT for iOS)
    if (!permission.isAuth && !permission.hasAccess) {
      isLoading = false;
      notifyListeners();
      return;
    }

    // Fetch "Recent" / "All Photos" album
    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );

    if (albums.isEmpty) {
      isLoading = false;
      notifyListeners();
      return;
    }

    final recentAlbum = albums.first;

    galleryImages = await recentAlbum.getAssetListPaged(
      page: 0,
      size: 100, // increase if you want more
    );

    isLoading = false;
    notifyListeners();
  }

  // ends here

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage = File(image.path);
      notifyListeners();
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImage = File(image.path);
      notifyListeners();
    }
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  pickFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
