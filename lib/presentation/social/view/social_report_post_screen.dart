import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/social_report_post_viewmodel.dart';

class SocialReportPostScreen extends StatelessWidget {
  const SocialReportPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialReportPostViewmodel(context: context),
      child: Consumer<SocialReportPostViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Report Post",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...viewModel.reportOptions.map((reason) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: AppButton(
                          textStyle: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF3D3D3D),
                          ),
                          label: reason,
                          onTap: () {
                            viewModel.selectReason(reason);
                          },
                        ),
                      );
                    }),

                    if (viewModel.showOtherField) ...[
                      const SizedBox(height: 16),

                      TextField(
                        controller: viewModel.otherController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Type your reason here...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Text(
                        "Max 250 Characters",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF5D5D5D),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Center(
                        child: AppButton(
                          label: "Report Post",
                          onTap: () {
                            viewModel.submitOtherReason();
                          },
                          width: 230,
                          textColor: Colors.white,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF090216), Color(0xFF9D306A)],
                          ),
                        ),
                      ),
                    ],
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
