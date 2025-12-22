import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    icon: Icon(
                      Icons.search,
                      color: viewModel.isSearchVisible
                          ? Colors.grey
                          : Colors.white,
                    ),
                    onPressed: () {
                      viewModel.toggleSearch();
                    },
                  ),

                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onSelected: (value) {
                      viewModel.onChatMenuSelected(action: value);
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'block',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AssetsPath.block),
                            const SizedBox(width: 5),

                            Text(
                              'Block',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Color(0XFF3D3D3D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'muteNotification',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AssetsPath.muteNotifications),
                            const SizedBox(width: 5),

                            Text(
                              'Mute Notifications',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Color(0XFF3D3D3D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            body: Column(
              children: [
                Visibility(
                  visible: viewModel.isSearchVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                              autofocus: true,
                              decoration: const InputDecoration(
                                hintText: 'Search people or conversations...',
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

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

                _ChatInputBar(viewModel: viewModel),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ChatInputBar extends StatelessWidget {
  final SocialChatViewmodel viewModel;

  const _ChatInputBar({super.key, required this.viewModel});

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
                      key: viewModel.attachKey,
                      icon: const Icon(
                        Icons.attach_file,
                        size: 22,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _openAttachMenu(
                          context,
                          viewModel,
                          viewModel.attachKey,
                        );
                      },
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

void _openAttachMenu(
  BuildContext context,
  SocialChatViewmodel viewModel,
  GlobalKey attachKey,
) async {
  final RenderBox button =
      attachKey.currentContext!.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(Offset.zero, ancestor: overlay),
      button.localToGlobal(
        button.size.bottomRight(Offset.zero),
        ancestor: overlay,
      ),
    ),
    Offset.zero & overlay.size,
  );

  final value = await showMenu<String>(
    context: context,
    position: position,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    items: [
      PopupMenuItem(
        value: 'gallery',
        child: Row(
          children: [
            SvgPicture.asset(AssetsPath.chatGallery),
            const SizedBox(width: 8),
            Text(
              'Gallery',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0XFF3D3D3D),
              ),
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 'document',
        child: Row(
          children: [
            SvgPicture.asset(AssetsPath.chatDocument),
            const SizedBox(width: 8),
            Text(
              'Document',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0XFF3D3D3D),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  if (value != null) {
    viewModel.onAttchmentTapped(action: value);
  }
}
