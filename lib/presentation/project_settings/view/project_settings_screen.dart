import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/project_details/utils.dart';
import 'package:sceneary/presentation/project_settings/view/project_information_screen.dart';
import 'package:sceneary/presentation/project_settings/view/project_status_screen.dart';
import 'package:sceneary/presentation/project_settings/view/roles_and_permission_screen.dart';
import 'package:sceneary/presentation/project_settings/viewmodel/project_settings_viewmodel.dart';

class ProjectSettingsScreen extends StatelessWidget {
  const ProjectSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => ProjectSettingsViewmodel(context: context),
      child: Consumer<ProjectSettingsViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Project Settings',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
                actions: [
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

            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                  'Configure project details, permissions, and manage project status',
                  style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 16),
                   Container(
                    width: double.infinity,
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0x33000000)),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          tabItem(
                            index: 0,
                            viewModel: viewModel,
                            iconPath: AssetsPath.projectsActiveImg,
                            label: "Project Information",
                          ),
                          SizedBox(width: 16),
              
                          tabItem(
                            index: 1,
                            viewModel: viewModel,
                            iconPath: AssetsPath.changeAccess,
                            label: "Roles & Permissions",
                          ),
                          SizedBox(width: 16),
              
                          tabItem(
                            index: 2,
                            viewModel: viewModel,
                            iconPath: AssetsPath.projectsActiveImg,
                            label: "Project Status",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                   Expanded(
                    child: PageView(
                      controller: viewModel.pageController,
                      onPageChanged: (index) {
                        viewModel.updatePage(index);
                      },
                      children: [
                       ProjectInformationScreen(),
                       RolesAndPermissionScreen(),
                       ProjectStatusScreen(),
                      ],
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
  Widget tabItem({
  required int index,
  required ProjectSettingsViewmodel viewModel,
  required String iconPath,
  required String label,
}) {
  bool isSelected = viewModel.selectTab == index;
  return InkWell(
    onTap: () => viewModel.changeTab(index),
    child: Container(
      padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF454545) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:isSelected
           ?Color(0x33000000)
           : Colors.transparent),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            color: isSelected ? Colors.white : Colors.black,
          ),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
}
