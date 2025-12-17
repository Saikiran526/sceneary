import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => viewModel.showPicker(context),
                      child: Container(
                        width: double.infinity,
                        height: 420,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(16),
                          image: viewModel.selectedImage != null
                              ? DecorationImage(
                                  image: FileImage(viewModel.selectedImage!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: viewModel.selectedImage == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add_a_photo,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Tap to add photo",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            : null,
                      ),
                    ),

                    const SizedBox(height: 15),

                    CustomTextField(
                      label: "Caption",
                      hintText: "Entert here",
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    AppButton(
                      label: "Upload Post",
                      fullWidth: true,
                      onTap: () {},
                      textColor: Colors.white,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF090216), Color(0xFF9D306A)],
                      ),
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
