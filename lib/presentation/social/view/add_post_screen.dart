import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/social/viewmodel/add_post_viewmodel.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddPostViewmodel(context: context),
      child: Consumer<AddPostViewmodel>(
        builder: (context, viewModel, child) {
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 88,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0XFF1D55A8),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Text",
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
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "Gallery",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Builder(
                      builder: (context) {
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                              ),
                          itemBuilder: (context, index) {
                            final asset = viewModel.galleryImages[index];

                            return FutureBuilder<Uint8List?>(
                              future: asset.thumbnailDataWithSize(
                                const ThumbnailSize(200, 200),
                              ),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(color: Colors.grey.shade200);
                                }

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.memory(
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}













  //  SingleChildScrollView(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       children: [
            //         GestureDetector(
            //           onTap: () => viewModel.showPicker(context),
            //           child: Container(
            //             width: double.infinity,
            //             height: 420,
            //             decoration: BoxDecoration(
            //               color: const Color(0xFFD9D9D9),
            //               borderRadius: BorderRadius.circular(16),
            //               image: viewModel.selectedImage != null
            //                   ? DecorationImage(
            //                       image: FileImage(viewModel.selectedImage!),
            //                       fit: BoxFit.cover,
            //                     )
            //                   : null,
            //             ),
            //             child: viewModel.selectedImage == null
            //                 ? Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: const [
            //                       Icon(
            //                         Icons.add_a_photo,
            //                         size: 40,
            //                         color: Colors.grey,
            //                       ),
            //                       SizedBox(height: 8),
            //                       Text(
            //                         "Tap to add photo",
            //                         style: TextStyle(color: Colors.grey),
            //                       ),
            //                     ],
            //                   )
            //                 : null,
            //           ),
            //         ),

            //         const SizedBox(height: 15),

            //         CustomTextField(
            //           label: "Caption",
            //           hintText: "Entert here",
            //           maxLines: 2,
            //         ),
            //         const SizedBox(height: 10),
            //         AppButton(
            //           label: "Upload Post",
            //           fullWidth: true,
            //           onTap: () {},
            //           textColor: Colors.white,
            //           gradient: const LinearGradient(
            //             begin: Alignment.topLeft,
            //             end: Alignment.bottomRight,
            //             colors: [Color(0xFF090216), Color(0xFF9D306A)],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),