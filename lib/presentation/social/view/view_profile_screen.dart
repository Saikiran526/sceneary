import 'package:flutter/material.dart';
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
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(172),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,

                flexibleSpace: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(AssetsPath.socialBg, fit: BoxFit.cover),

                    SafeArea(
                      bottom: false,
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 32,
                                    backgroundImage: AssetImage(
                                      AssetsPath.women,
                                    ),
                                  ),
                                  const SizedBox(width: 16),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              onTap: () =>
                                                  viewModel.changeTab(0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "19",
                                                    style: GoogleFonts.montserrat(
                                                      color:
                                                          viewModel
                                                                  .selectedTab ==
                                                              0
                                                          ? Colors.white
                                                          : Colors.white70,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Posts",
                                                    style: GoogleFonts.montserrat(
                                                      color:
                                                          viewModel
                                                                  .selectedTab ==
                                                              0
                                                          ? Colors.white
                                                          : Colors.white70,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: () =>
                                                  viewModel.changeTab(1),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "240",
                                                    style: GoogleFonts.montserrat(
                                                      color:
                                                          viewModel
                                                                  .selectedTab ==
                                                              1
                                                          ? Colors.white
                                                          : Colors.white70,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Connections",
                                                    style: GoogleFonts.montserrat(
                                                      color:
                                                          viewModel
                                                                  .selectedTab ==
                                                              1
                                                          ? Colors.white
                                                          : Colors.white70,
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
            ),

            body: Padding(
              padding: const EdgeInsets.all(16),
              child: viewModel.selectedTab == 1
                  ? _ConnectionsTab(viewModel)
                  : _FeedTab(viewModel),
            ),
          );
        },
      ),
    );
  }
}

/// 🔹 Connections Tab
class _ConnectionsTab extends StatelessWidget {
  final ViewProfileViewmodel viewModel;

  const _ConnectionsTab(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Connections",
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.connections.length,
            itemBuilder: (context, index) {
              final user = viewModel.connections[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage(user["image"]!),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        user["name"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 70,
                        maxWidth: 90,
                        minHeight: 35,
                      ),
                      child: AppButton(
                        label: "Message",
                        height: 35,
                        buttonColor: const Color(0XFF1D55A8),
                        textColor: Colors.white,
                        onTap: () {
                          AppRouter.instance.push(
                            RoutePaths.socialChatRequestScreen,
                          );
                        },
                      ),
                    ),
                    PopupMenuButton<String>(
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                      icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF090216), Color(0xFF9D306A)],
                            stops: [0.0, 1.0],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcIn,
                        child: const Icon(
                          Icons.more_vert,
                          size: 24,
                          color: Colors.white, 
                        ),
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
                        PopupMenuItem(value: 'Block', child: Text('Block')),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// 🔹 Feed Tab
class _FeedTab extends StatelessWidget {
  final ViewProfileViewmodel viewModel;

  const _FeedTab(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Feed",
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.posts.length,
            itemBuilder: (context, index) {
              final post = viewModel.posts[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(AssetsPath.women),
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
                          icon: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF090216), Color(0xFF9D306A)],
                                stops: [0.0, 1.0],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.srcIn,
                            child: const Icon(
                              Icons.more_vert,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),

                          onSelected: (value) {
                            viewModel.onPostMenuSelected(
                              action: value,
                              postIndex: index,
                            );
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 'Edit', child: Text('Edit')),
                            PopupMenuItem(
                              value: 'Delete',
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        post['image'],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// 🔹 Profile Stat Widget
class _ProfileStat extends StatelessWidget {
  final String label;
  final String count;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfileStat({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            count,
            style: GoogleFonts.montserrat(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
