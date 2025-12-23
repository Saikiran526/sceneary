import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/social_viewmodel.dart';

class LikesBottomSheet extends StatelessWidget {
  const LikesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Consumer<SocialViewmodel>(
          builder: (context, viewModel, _) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // Title
                  Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF090216), Color(0xFF9D306A)],
                        ).createShader(bounds);
                      },
                      child: Text(
                        "Likes",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: viewModel.likes.length,
                      itemBuilder: (context, index) {
                        final user = viewModel.likes[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 16,
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/150",
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  user.name,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFF252525),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: AppButton(
                                  label: user.isConnected
                                      ? "Send Message"
                                      : "Send Connection",
                                  width: 120,
                                  height: 32,
                                  buttonColor: user.isConnected
                                      ? Colors.white
                                      : const Color(0XFF1D55A8),
                                  textColor: user.isConnected
                                      ? const Color(0XFF1D55A8)
                                      : Colors.white,
                                  borderColor: user.isConnected
                                      ? const Color(0XFF1D55A8)
                                      : null,
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
