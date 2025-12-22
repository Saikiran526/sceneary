import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/social/helper_bottomsheets/show_top_alert.dart';
import 'package:sceneary/presentation/social/viewmodel/show_post_viewmodel.dart';

class ShowPostScreen extends StatelessWidget {
  const ShowPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShowPostViewmodel(context: context),
      child: Consumer<ShowPostViewmodel>(
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
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      height: 420,

                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(16),
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
                      onTap: () {
                        showTopAlert(
                          context,
                          message: "Post Uploaded Successfully",
                        );
                      },
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
