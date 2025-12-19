import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/social/viewmodel/social_chat_request_viewmodel.dart';

class SocialChatRequestScreen extends StatelessWidget {
  const SocialChatRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialChatRequestViewmodel(context: context),
      child: Consumer<SocialChatRequestViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Color(0XFFEEEEEE),
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
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    reverse: false,
                    itemCount: 2,

                    itemBuilder: (context, index) {
                      final isMe = index % 2 == 0;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: isMe
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            if (!isMe)
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(AssetsPath.women),
                                ),
                              ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.65,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Text(
                                isMe
                                    ? "Hey! This looks like Instagram chat"
                                    : "Yes! Clean bubbles and smooth UI.",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text("Block User"),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text("Add Connection"),
                          ),
                        ),
                      ],
                    ),
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Message...",
                    border: InputBorder.none,

                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.attach_file,
                        size: 22,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              decoration: const BoxDecoration(
                color: Color(0XFF1D55A8),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
