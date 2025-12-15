import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/group_chat/viewmodel/individual_chat_viewmodel.dart';

class IndividualChatScreen extends StatelessWidget {
  const IndividualChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IndividualChatViewmodel(context: context),
      child: Consumer<IndividualChatViewmodel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),

            /// ✅ APP BAR
            appBar: AppBar(
              backgroundColor: Colors.green,
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.08),
              toolbarHeight: 80,
              leadingWidth: 56,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  AppRouter.instance.push(RoutePaths.groupChatHistoryScreen);
                },
              ),
              titleSpacing: 0,
              title: Row(
                children: [
                  CircleAvatar(radius: 24, backgroundColor: Color(0xFFD9D9D9)),
                  SizedBox(width: 12),
                  Text(
                    'JD',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, size: 22, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    size: 22,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    viewModel.showPopMoreVert();
                  },
                ),
              ],
            ),

            /// ✅ BODY
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final msg = viewModel.messages[index];
                      return Align(
                        alignment: msg.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            msg.text,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// MESSAGE INPUT
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: viewModel.messageController,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  viewModel.showPopUpMenu();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                    AssetsPath.attach,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: viewModel.sendMessage,
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.send,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
