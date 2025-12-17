import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/social_notification_viewmodel.dart';

class SocialNotificationScreen extends StatelessWidget {
  const SocialNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialNotificationViewmodel(context: context),
      child: Consumer<SocialNotificationViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Notifications",
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
                    Container(
                      height: 64,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(AssetsPath.men1),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              "Arya liked your post",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Container(
                       padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage(AssetsPath.men1),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  '"Arya " wants to connect with you.',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 24,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppButton(
                                  label: "Delete",
                                  onTap: () {},
                                  textColor: Colors.black,
                                  buttonColor: Colors.white,
                                  borderColor: Colors.black,
                                  height: 27,
                                  width: 80,
                                ),
                              ),
                              Expanded(
                                child: AppButton(
                                  label: "Accept",
                                  onTap: () {},
                                  textColor: Colors.white,
                                  buttonColor: Color(0XFF1D55A8),
                                  height: 27,
                                  width: 80,
                                ),
                              ),
                            ],
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
