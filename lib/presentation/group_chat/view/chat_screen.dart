import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/group_chat/viewmodel/chat_viewmodel.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/project_details/utils.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => ChatViewmodel(context: context),
      child: Consumer<ChatViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AppRouter.instance.push(RoutePaths.groupChatHistoryScreen);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 137,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFFD9D9D9),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'The Lost Chronicle',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Ram, Seetha, Arjun, das',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.search, size: 22),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => servicePopUpMenu(context),
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.04),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(AssetsPath.menuImg),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: viewModel.messages.length,
                    itemBuilder: (context, index) {
                      final msg = viewModel.messages[index];
                      return Align(
                        alignment: msg.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            msg.text,
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: viewModel.messageController,
                          decoration: InputDecoration(
                            suffixIcon: SizedBox(
                              height: 20,
                              width: 20,
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.showPopUpMenu();
                                },
                                child: SvgPicture.asset(
                                  AssetsPath.attach,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            hintText: "Type a message...",
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => viewModel.sendMessage(),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
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
