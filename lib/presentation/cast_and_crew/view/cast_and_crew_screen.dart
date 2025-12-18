import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_dropdown.dart';
import 'package:sceneary/presentation/cast_and_crew/viewmodel/cast_and_crew_viewmodel.dart';
import 'package:sceneary/presentation/project_details/utils.dart';

class CastAndCrewScreen extends StatelessWidget {
  const CastAndCrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => CastAndCrewViewmodel(context: context),
      child: Consumer<CastAndCrewViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF090216), Color(0xFF9D306A)],
                  ),
                ),
              ),
              title: const Text(
                'Cast & Crew Availability',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: false,
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

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color: Color.fromARGB(255, 157, 155, 155),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        maxLines: 1,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
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

                    DefaultTabController(
                      length: 2,
                      initialIndex: viewModel.selectedTab,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0XFFF9EAF5),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: TabBar(
                              onTap: viewModel.changeTab,

                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: const Color(0XFF9D306A),
                                borderRadius: BorderRadius.circular(6),
                              ),

                              dividerColor: Colors.transparent,

                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              tabs: const [
                                Tab(text: "Members"),
                                Tab(text: "Availability"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          IndexedStack(
                            index: viewModel.selectedTab,
                            children: [
                              /// MEMBERS TAB (PASTE YOUR EXISTING MEMBERS UI HERE)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 🔥 everything you already had for Members
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xFF454545),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '+Add Member',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor: Color(
                                                        0xFFD9D9D9,
                                                      ),
                                                    ),

                                                    const SizedBox(width: 12),

                                                    /// Name & Role
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Ram',
                                                          style:
                                                              GoogleFonts.montserrat(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'Hero',
                                                          style:
                                                              GoogleFonts.poppins(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color(
                                                                  0xFF5D5D5D,
                                                                ),
                                                              ),
                                                        ),
                                                      ],
                                                    ),

                                                    const Spacer(),

                                                    /// Resend Button
                                                    Container(
                                                      height: 32,
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                          0xFFD3D3D3,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Text(
                                                        'Resend',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),

                                                    const SizedBox(width: 12),

                                                    /// Cancel Icon
                                                    GestureDetector(
                                                      onTap: () {
                                                        // cancel action
                                                      },
                                                      child: SvgPicture.asset(
                                                        AssetsPath.cancelImg,
                                                        width: 14,
                                                        height: 14,
                                                      ),
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
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 4,
                                            separatorBuilder: (_, __) =>
                                                const Divider(height: 1),
                                            itemBuilder: (context, index) {
                                              final accessList = [
                                                'Editor',
                                                'Manager',
                                                'Viewer',
                                                'Manager',
                                              ];

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8,
                                                    ),
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor: Color(
                                                        0xFFD9D9D9,
                                                      ),
                                                    ),

                                                    const SizedBox(width: 10),

                                                    /// Name & Role
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text(
                                                          'JD',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'Director',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                              0xFF5D5D5D,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    const Spacer(),

                                                    /// Access badge
                                                    Container(
                                                      height: 25,
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                          0xFF474747,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        accessList[index],
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),

                                                    const SizedBox(width: 16),

                                                    buildPopupMenu(
                                                      context,
                                                      viewModel,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomDropdownField(
                                          items: viewModel.chooseCraft,
                                          onChanged: (value) {
                                            if (value != null) {
                                              viewModel.selectCraft!;
                                            }
                                          },
                                          label: "Project Role",
                                          hintText: "Select",
                                        ),
                                        Text(
                                          "People list",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                          ),
                                          child: Column(
                                            children: List.generate(3, (index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 12,
                                                ),
                                                child: Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.white,
                                                      ),
                                                    ),

                                                    const SizedBox(width: 12),

                                                    Expanded(
                                                      child: Text(
                                                        "John Snow ${index + 1}",
                                                        style:
                                                            GoogleFonts.montserrat(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),

                                                    Checkbox(
                                                      value: viewModel
                                                          .isSelected(index),
                                                      onChanged: (value) {
                                                        viewModel.toggle(
                                                          index,
                                                          value ?? false,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        ),

                                        CustomTextField(
                                          label: "Choose Date",
                                          controller:
                                              viewModel.showDateController,
                                          hintText: "Select Date",
                                          suffixIcon: Icons.calendar_month,
                                          enabled: false,
                                          onTap: () {
                                            viewModel.selectDate();
                                          },
                                        ),
                                        SizedBox(height: 24),

                                        AppButton(
                                          label: "View",
                                          fullWidth: true,
                                          buttonColor: Color(0XFF1D55A8),
                                          textColor: Colors.white,
                                          onTap: () {
                                            AppRouter.instance.push(
                                              RoutePaths
                                                  .castAndCrewAvailabilityScreen,
                                            );
                                          },
                                        ),
                                      ],
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
