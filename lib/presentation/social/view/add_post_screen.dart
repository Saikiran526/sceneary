import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/add_post_viewmodel.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddPostViewmodel(context: context)..loadGallery(),
      child: Consumer<AddPostViewmodel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Back",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _actionButtons(viewModel),
                  const SizedBox(height: 16),
                  _galleryTitle(),
                  const SizedBox(height: 12),
                  _galleryGrid(viewModel),
                  const SizedBox(height: 80), // 👈 space for bottom button
                ],
              ),
            ),
            bottomNavigationBar: _bottomPostButton(viewModel),
          );
        },
      ),
    );
  }

  Widget _bottomPostButton(AddPostViewmodel viewModel) {
    if (viewModel.selectedIndexes.isEmpty) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: AppButton(
            label: "Next (${viewModel.selectedIndexes.length})",
            textColor: Colors.white,
            onTap: () {
              AppRouter.instance.push(RoutePaths.showPostScreen);
            },
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF090216), Color(0xFF9D306A)],
            ),
          ),
        ),
      ),
    );
  }

  // ========================= ACTION BUTTONS =========================

  Widget _actionButtons(AddPostViewmodel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionTile(
          icon: Icons.edit,
          label: "Text",
          onTap: viewModel.onTextPost,
        ),
        _actionTile(
          icon: Icons.camera_enhance,
          label: "Camera",
          onTap: viewModel.openCamera,
        ),
        _actionTile(
          icon: Icons.upload_outlined,
          label: "Upload",
          onTap: viewModel.pickFromGallery,
        ),
      ],
    );
  }

  Widget _actionTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 88,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0XFF1D55A8),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ========================= GALLERY TITLE =========================

  Widget _galleryTitle() {
    return Text(
      "Gallery",
      style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
    );
  }

  // ========================= GALLERY GRID =========================

  Widget _galleryGrid(AddPostViewmodel viewModel) {
    if (viewModel.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (viewModel.galleryImages.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text("No images found"),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.galleryImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        final asset = viewModel.galleryImages[index];

        return FutureBuilder<Uint8List?>(
          future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(color: Colors.grey.shade200);
            }

            final isSelected = viewModel.selectedIndexes.contains(index);

            return GestureDetector(
              onTap: () => viewModel.toggleSelection(index),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.memory(
                      snapshot.data!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0XFF1D55A8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
