import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/messages/viewmodel/messages_viewmodel.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessagesViewmodel(context: context),
      child: Consumer<MessagesViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            /// 🔹 CUSTOM APPBAR WITH SEARCH
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: AppBar(
                elevation: 2,
                automaticallyImplyLeading: false,
                titleSpacing: 16,
                title: Row(
                  children: [
                    const Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(AssetsPath.notificationImg),
                  ],
                ),

                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(56),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: SizedBox(
                      height: 48,
                      child: TextField(
                        controller: viewModel.searchController,
                        decoration: InputDecoration(
                          hintText: 'Search people or conversations...',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// 🔹 BODY
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// HEADER
                  Row(
                    children: const [
                      Text(
                        'Chats',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Requests',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// CHAT LIST
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: 7,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () {
                                AppRouter.instance.push(
                                  RoutePaths.messagesIndividualChatScreen,
                                );
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Color(0xFFD9D9D9),
                                  ),
                                  const SizedBox(width: 16),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'JD',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Haa...',
                                          style: GoogleFonts.inter(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF5D5D5D),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    '18/11/2025',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4F4F4F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
