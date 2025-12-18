import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/dashboard/dashboard_viewmodel.dart';
import 'package:sceneary/presentation/home/home_screen.dart';
import 'package:sceneary/presentation/profile/profile_screen.dart';
import 'package:sceneary/presentation/projects/projects_screen.dart';
import 'package:sceneary/presentation/search_result_screen/search_result_screen.dart';
import 'package:sceneary/presentation/social/view/social_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => DashboardViewModel(),
      child: Consumer<DashboardViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar:
                (viewModel.selectedIndex == 0 || viewModel.selectedIndex == 1)
                ? AppBar(
                    backgroundColor: Colors.grey.shade300,
                    toolbarHeight: 80,
                    title: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xff958D8D),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Saikiran',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                'FE-Developer',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(60),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                child: TextField(
                                  controller: viewModel.searchQueryController,
                                  onChanged: (query) {
                                    viewModel.setSearchQuery = query;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    hintText: "Search here...",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (viewModel
                                .searchQueryController
                                .text
                                .isNotEmpty) ...[
                              SizedBox(width: width * 0.02),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AssetsPath.filterImg),
                                      SizedBox(width: width * 0.01),
                                      Text(
                                        'Filter',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff5D5D5D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          AppRouter.instance.push(
                            RoutePaths.notificationsScreen,
                          );
                        },
                        icon: SvgPicture.asset(AssetsPath.notificationImg),
                      ),
                    ],
                  )
                : null,
            body: Consumer<DashboardViewModel>(
              builder: (context, viewModel, child) {
                return [
                  viewModel.searchQueryController.text.isEmpty
                      ? HomeScreen()
                      : SearchResultScreen(),
                  ProjectsScreen(),
                  SocialScreen(),
                  ProfileScreen(),
                ][viewModel.selectedIndex];
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: viewModel.selectedIndex,
              onTap: (index) {
                viewModel.setSelectedIndex = index;
              },
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: viewModel.selectedIndex == 0
                      ? SvgPicture.asset(AssetsPath.homeActiveImg)
                      : SvgPicture.asset(AssetsPath.homeInActiveImg),
                ),
                BottomNavigationBarItem(
                  label: 'Projects',
                  icon: viewModel.selectedIndex == 1
                      ? SvgPicture.asset(AssetsPath.projectsActiveImg)
                      : SvgPicture.asset(AssetsPath.projectsInActiveImg),
                ),
                BottomNavigationBarItem(
                  label: 'Social',
                  icon: viewModel.selectedIndex == 2
                      ? SvgPicture.asset(AssetsPath.socialActive)
                      : SvgPicture.asset(AssetsPath.socialInActive),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: viewModel.selectedIndex == 3
                      ? SvgPicture.asset(AssetsPath.profileActiveImg)
                      : SvgPicture.asset(AssetsPath.profileInActiveImg),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
