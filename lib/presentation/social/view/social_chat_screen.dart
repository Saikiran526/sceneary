import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/social/viewmodel/social_chat_viewmodel.dart';

class SocialChatScreen extends StatelessWidget {
  const SocialChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialChatViewmodel(context: context),
      child: Consumer<SocialChatViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),

              elevation: 0,
              toolbarHeight: 100,
              backgroundColor: Colors.transparent,

              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF090216), Color(0xFF9D306A)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),

              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(AssetsPath.women),
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "User Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),

                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onSelected: (value) {
                      viewModel.onChatMenuSelected(action: value);
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'block', child: Text('Block')),
                      PopupMenuItem(
                        value: 'muteNotification',
                        child: Text('Mute Notifications'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            body: Column(
              children: [
                // Messages
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    reverse: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final isMe = index % 2 == 0;

                      return Align(
                        alignment: isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.white : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(18),
                              topRight: const Radius.circular(18),
                              bottomLeft: isMe
                                  ? const Radius.circular(18)
                                  : Radius.zero,
                              bottomRight: isMe
                                  ? Radius.zero
                                  : const Radius.circular(18),
                            ),
                          ),
                          child: Text(
                            isMe
                                ? "Hey! This looks like Instagram chat 😍"
                                : "Yes! Clean bubbles and smooth UI ✨",
                            style: TextStyle(
                              color: isMe ? Colors.black : Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                
                
                
                  ),
                ),

                _ChatInputBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ChatInputBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Message...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            IconButton(
              icon: const Icon(Icons.send, color: Color(0xFF9D306A)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
