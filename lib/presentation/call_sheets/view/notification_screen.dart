import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/call_sheets/viewmodel/notification_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationViewmodel(context: context),
      child: Consumer<NotificationViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF090216), Color(0xFF9D306A)],
                  ),
                ),
              ),
              title: Text(
                "Notifications",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: viewModel.showDetails
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Call Sheets",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 1.0,
                            ),
                          ),

                          const SizedBox(height: 12),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AssetsPath.callSheetPreview,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0XFFF9EAF5),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 8,
                                  color: Color(0x1A6E6E6E),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 15),
                                  blurRadius: 15,
                                  color: Color(0x176E6E6E),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 35),
                                  blurRadius: 21,
                                  color: Color(0x0D6E6E6E),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 61),
                                  blurRadius: 25,
                                  color: Color(0x036E6E6E),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 96),
                                  blurRadius: 27,
                                  color: Color(0x006E6E6E),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  ' "New call sheet is created" ',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    height: 1.0,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Scenes 14 & 14A are scheduled on 12 Oct",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    height: 1.0,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppButton(
                                    height: 27,
                                    label: "View details",
                                    buttonColor: Color(0XFF1D55A8),
                                    textColor: Colors.white,
                                    onTap: () {
                                      viewModel.toggleDetails();
                                    },
                                    fullWidth: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "2h ago",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        height: 1.0,
                                        letterSpacing: 0,
                                        color: Color(0XFF888888),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
