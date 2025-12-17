import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/social/viewmodel/social_viewmodel.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialViewmodel(context: context),
      child: Consumer<SocialViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pink,
              elevation: 0,
              toolbarHeight: 100,

              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      AppRouter.instance.push(RoutePaths.viewProfileScreen);
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(AssetsPath.women),
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "Social",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      AppRouter.instance.push(RoutePaths.addPostScreen);
                    },
                    child: SvgPicture.asset(
                      AssetsPath.socialFeed,
                      width: 24,
                      height: 24,
                    ),
                  ),

                  const SizedBox(width: 16),

                  GestureDetector(
                    onTap: () {
                      AppRouter.instance.push(
                        RoutePaths.socialNotificationsScreen,
                      );
                    },
                    child: SvgPicture.asset(
                      AssetsPath.socialNotification,
                      width: 24,
                      height: 24,
                    ),
                  ),

                  const SizedBox(width: 16),

                  GestureDetector(
                    onTap: () {
                      AppRouter.instance.push(RoutePaths.socialMessagesScreen);
                    },
                    child: SvgPicture.asset(
                      AssetsPath.socialMessage,
                      width: 24,
                      height: 24,
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
                            onTap: () {
                              AppRouter.instance.push(
                                RoutePaths.socialSearchScreen,
                              );
                            },
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Feed",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                                      itemBuilder: (context) => const [
                                        PopupMenuItem(
                                          value: 'report',
                                          child: Text('Report'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  post['image'],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // 🔹 Actions
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => viewModel.toggleLike(index),
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
                                          fit: BoxFit.cover,
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
