import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/social_report_success_viewmodel.dart';

class SocialReportSuccessScreen extends StatelessWidget {
  const SocialReportSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialReportSuccessViewmodel(context: context),
      child: Consumer<SocialReportSuccessViewmodel>(
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
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),

                      SvgPicture.asset(
                        AssetsPath.reportSuccess,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Thanks for letting us know",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        "Your report has been submitted. We’ll review this post and take action if it violates our community guidelines.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF5D5D5D),
                          fontSize: 12,
                        ),
                        softWrap: true,
                      ),
                      const SizedBox(height: 20),

                      AppButton(
                        label: "Done",
                        onTap: () {},
                        width: 230,
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
            ),
          );
        },
      ),
    );
  }
}
