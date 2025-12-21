import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/social/viewmodel/view_profile_viewmodel.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewProfileViewmodel(context: context),
      child: Consumer<ViewProfileViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 150,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,

              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: [
                   Image.asset(AssetsPath.socialBg, fit: BoxFit.cover),

                   Container(color: Colors.black.withOpacity(0.25)),

                   SafeArea(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left: 8,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 32,
                                  backgroundImage: AssetImage(AssetsPath.women),
                                ),
                                const SizedBox(width: 16),

                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 45,
                                        ),
                                        child: const Text(
                                          "Username_01",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () => viewModel.changeTab(0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "19",
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        viewModel.selectedTab ==
                                                            0
                                                        ? Colors.white
                                                        : Colors.white70,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Posts",
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        viewModel.selectedTab ==
                                                            0
                                                        ? Colors.white
                                                        : Colors.white70,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap: () => viewModel.changeTab(1),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "19",
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        viewModel.selectedTab ==
                                                            1
                                                        ? Colors.white
                                                        : Colors.white70,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Connections",
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        viewModel.selectedTab ==
                                                            1
                                                        ? Colors.white
                                                        : Colors.white70,
                                                    fontSize: 12,
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: viewModel.selectedTab == 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔹 Connections Title
                          Text(
                            "Connections",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),

                          /// 🔹 Connections List
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: viewModel.connections.length,
                            itemBuilder: (context, index) {
                              final user = viewModel.connections[index];

                              return SizedBox(
                                width: double.infinity, // ✅ full row width
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundImage: AssetImage(
                                          user["image"]!,
                                        ),
                                      ),
                                      const SizedBox(width: 12),

                                      /// Name
                                      Expanded(
                                        child: Text(
                                          user["name"]!,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),

                                      /// Message Button
                                      AppButton(
                                        label: "Message",
                                        height: 35,
                                        width: 87,
                                        buttonColor: const Color(0XFF1D55A8),
                                        textColor: Colors.white,
                                        onTap: () {
                                          AppRouter.instance.push(
                                            RoutePaths.socialChatRequestScreen,
                                          );
                                        },
                                      ),

                                      const SizedBox(width: 8),

                                      /// More Menu
                                      PopupMenuButton<String>(
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                        ),
                                        onSelected: (value) {
                                          viewModel.onConnectionMenuSelected(
                                            action: value,
                                            postIndex: index,
                                          );
                                        },
                                        itemBuilder: (context) => const [
                                          PopupMenuItem(
                                            value: 'Remove Connection',
                                            child: Text('Remove Connection'),
                                          ),
                                          PopupMenuItem(
                                            value: 'Block',
                                            child: Text('Block'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔹 Feed Title
                          Text(
                            "Feed",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),

                          /// 🔹 Posts List
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: viewModel.posts.length,
                            itemBuilder: (context, index) {
                              final post = viewModel.posts[index];

                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Header
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 18,
                                            backgroundImage: AssetImage(
                                              AssetsPath.women,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              post['name'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),

                                          PopupMenuButton<String>(
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: Colors.black,
                                            ),
                                            onSelected: (value) {
                                              viewModel.onPostMenuSelected(
                                                action: value,
                                                postIndex: index,
                                              );
                                            },
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                value: 'Edit',
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AssetsPath.edit,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      'Edit',
                                                      style:
                                                          GoogleFonts.montserrat(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 'Delete',
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AssetsPath.delete,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      'Delete',
                                                      style:
                                                          GoogleFonts.montserrat(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
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

                                    /// Image
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        post['image'],
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    /// Actions
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () =>
                                                viewModel.toggleLike(index),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  post['isLiked']
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: post['isLiked']
                                                      ? Colors.red
                                                      : Colors.black,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  post['likes'].toString(),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                AssetsPath.socialComment,
                                                width: 24,
                                                height: 24,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                post['comments'].toString(),
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    /// Caption
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        12,
                                        0,
                                        12,
                                        12,
                                      ),
                                      child: Text(
                                        post['caption'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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
