import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/cast_and_crew/cast_and_crew_viewmodel.dart';

class CastAndCrewScreen extends StatelessWidget {
  const CastAndCrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CastAndCrewViewmodel(context: context),
      child: Consumer<CastAndCrewViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text(
                    'Cast & Crew',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(
                            0.08,
                          ), 
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(AssetsPath.menuImg,height: 24,width: 24,)
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 328,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF5D5D5D), width: 1),
                      ),
                      child: TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search by name or role..',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => viewModel.changeTab(0),
                          child: viewModel.selectedTab == 0
                              ? Container(
                                  width: 164,
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0Xff4F4F4F),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Members",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Text(
                                  "Members",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                        GestureDetector(
                          onTap: () => viewModel.changeTab(1),
                          child: viewModel.selectedTab == 1
                              ? Container(
                                  width: 164,
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(0Xff4F4F4F),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Availability",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Text(
                                  "Availability",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    viewModel.selectedTab == 0
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Pending Invitations',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        AppRouter.instance.push(
                                          RoutePaths.addMemberScreen,
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 32,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: Color(0xFF454545),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '+Add Member',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Column(
                                  children: List.generate(3, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 57,
                                        padding: EdgeInsets.fromLTRB(
                                          16,
                                          8,
                                          16,
                                          8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Color(
                                                0xFFD9D9D9,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Ram',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'hero',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF5D5D5D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 72,
                                              height: 32,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color(0xFFD3D3D3),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Resend',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            SvgPicture.asset(
                                              AssetsPath.cancelImg,
                                              width: 11,
                                              height: 11,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Manage Team',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  height: 365,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Color(
                                                0xFFD9D9D9,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'JD',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Director',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF5D5D5D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 76,
                                              height: 25,
                                              padding: EdgeInsets.fromLTRB(
                                                16,
                                                4,
                                                16,
                                                4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF474747),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Editor",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            buildPopupMenu(context, viewModel),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Color(
                                                0xFFD9D9D9,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'JD',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Director',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF5D5D5D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 76,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF474747),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Manager",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            buildPopupMenu(context, viewModel),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Color(
                                                0xFFD9D9D9,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'JD',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Director',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF5D5D5D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 76,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF474747),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Viewer",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            buildPopupMenu(context, viewModel),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Color(
                                                0xFFD9D9D9,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'JD',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Director',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF5D5D5D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 76,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF474747),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Manager",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            buildPopupMenu(context, viewModel),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Crafts',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color(0xFFEDF1F3),
                                      width: 1,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: viewModel.selectCraft,
                                      isExpanded: true,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 18,
                                      ),
                                      dropdownColor: Colors.white,
                                      items: viewModel.chooseCraft
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          viewModel.selectedCraft(value);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'View By People',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color(0xFFEDF1F3),
                                      width: 1,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: viewModel.viewPeople,
                                      isExpanded: true,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 18,
                                      ),
                                      dropdownColor: Colors.white,
                                      items: viewModel.choosePeopleView
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          viewModel.selectedChosedPeople(value);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Choose Date',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                customTextField(
                                  controller: viewModel.showDateController,
                                  hintText: 'Select Date',
                                  suffix: SvgPicture.asset(
                                    AssetsPath.calendarBold,
                                  ),
                                  onTap: () {
                                    viewModel.selectDate();
                                  },
                                ),
                                SizedBox(height: 24),
                                primaryButton(text: 'View', onPressed: () {}),
                              ],
                            ),
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

  Widget buildPopupMenu(BuildContext context, CastAndCrewViewmodel viewModel) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      child: PopupMenuButton<String>(
        icon: Icon(Icons.more_vert, color: Colors.black),
        onSelected: (value) {
          if (value == "remove") {
            viewModel.showRemoveDialog();
          } else if (value == "change") {
            viewModel.changeAccessDailog();
          } else if (value == "edit") {
            AppRouter.instance.push(RoutePaths.editMemberScreen);
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: "edit",
            child: Row(
              children: [
                SvgPicture.asset(AssetsPath.editMember),
                SizedBox(width: 15),
                Text(
                  "Edit Member",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "change",
            child: Row(
              children: [
                SvgPicture.asset(AssetsPath.changeAccess),
                SizedBox(width: 15),
                Text(
                  "Change Access",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "remove",
            child: Row(
              children: [
                SvgPicture.asset(AssetsPath.cancelImg, height: 13, width: 13),
                SizedBox(width: 20),
                Text(
                  "Remove",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
