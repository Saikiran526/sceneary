import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/messages/viewmodel/messages_individual_viewmodel.dart';

class MessagesIndividualChatScreen extends StatelessWidget {
  const MessagesIndividualChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessagesIndividualViewmodel(context: context),
      child: Consumer<MessagesIndividualViewmodel>(
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
                      'Message',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(AssetsPath.notificationImg),
                  ],
                ),

                /// 🔹 SEARCH BAR
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: SizedBox(
                      height: 44,
                      child: TextField(
                        controller: viewModel.searchController,
                        decoration: InputDecoration(
                          hintText: 'Search people or conversations...',
                          prefixIcon: const Icon(Icons.search),
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
                  /// CHAT PREVIEW CARD
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFFD9D9D9),
                          ),
                          const SizedBox(width: 16),

                          /// NAME
                          const Expanded(
                            child: Text(
                              'Ram',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          /// SEND MESSAGE BUTTON
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4F4F4F),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Send Message',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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
