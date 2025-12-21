import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/social_search_viewmodel.dart';

class SocialSearchScreen extends StatelessWidget {
  const SocialSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialSearchViewmodel(context: context),
      child: Consumer<SocialSearchViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0XFFEEEEEE),

            appBar: AppBar(
              backgroundColor: Color(0XFFEEEEEE),
              elevation: 0,
              toolbarHeight: 60,

              title: Row(
                children: [
                  const Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(64),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFF4D6EA),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search people or conversations...',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 64,
                      padding: const EdgeInsets.all(8),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(AssetsPath.women),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Arya Stark",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),

                          ElevatedButton(
                            onPressed: () {
                              AppRouter.instance.push(
                                RoutePaths.socialChatScreen,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF1D55A8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              minimumSize: const Size(0, 32),
                            ),
                            child: Text(
                              "Message",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
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
