import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/social/helper_bottomsheets/show_top_alert.dart';
import 'package:sceneary/presentation/social/viewmodel/add_text_viewmodel.dart';

class AddTextScreen extends StatelessWidget {
  const AddTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddTextViewmodel(context: context),
      child: Consumer<AddTextViewmodel>(
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
                    const SizedBox(height: 10),
                    CustomTextField(maxLines: 25, hintText: "Type a message"),
                    const SizedBox(height: 20),
                    AppButton(
                      label: "Upload Post",
                      textColor: Colors.white,
                      fullWidth: true,
                      onTap: () {
                        showTopAlert(
                          context,
                          message: "Post Uploaded Successfully",
                        );
                      },
                      gradient: const LinearGradient(
                        begin: Alignment(0.8, -1.0),
                        end: Alignment(-0.8, 1.0),
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
