import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/home/utils.dart';
import 'package:sceneary/presentation/search_result_screen/search_result_screen.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => HomeViewmodel(),
      child: Consumer<HomeViewmodel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: viewModel.searchQueryController.text.isEmpty
                        ? 250
                        : 190,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsPath.appbarBackgroundImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                  ),
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
                                  child: Image.asset(
                                    AssetsPath.profilePictureImg,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Mukesh Raj',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.01),
                                      SvgPicture.asset(AssetsPath.verifyImg),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Actor',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  AppRouter.instance.push(
                                    RoutePaths.notificationsScreen,
                                  );
                                },
                                icon: SvgPicture.asset(
                                  AssetsPath.notificationImg,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
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
                                    decoration: const InputDecoration(
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
                                SizedBox(width: 10),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(AssetsPath.filterImg),
                                        SizedBox(width: 6),
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
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  if (viewModel.searchQueryController.text.isEmpty)
                    Positioned(
                      bottom: -30,
                      left: 21,
                      right: 21,
                      child: Container(
                        height: height * 0.1,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: primaryColor100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              ...viewModel.remainingDatesOfCurrentMonth.map((
                                date,
                              ) {
                                return Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      viewModel.setSelectedDate = date;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 8.0,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: viewModel.selectedDate == date
                                              ? primaryColor700
                                              : primaryColor100,
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '$date',
                                                style: TextStyle(
                                                  color:
                                                      viewModel.selectedDate ==
                                                          date
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              if (viewModel.selectedDate ==
                                                  date)
                                                SizedBox(height: 10),
                                              if (viewModel.selectedDate ==
                                                  date)
                                                Text(
                                                  'Today',
                                                  style: TextStyle(
                                                    color:
                                                        viewModel
                                                                .selectedDate ==
                                                            date
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: primaryColor700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              // Search active screen
              if (viewModel.searchQueryController.text.isNotEmpty)
                Expanded(child: SearchResultScreen()),

              // Search In-active screen
              if (viewModel.searchQueryController.text.isEmpty)
                Expanded(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Today Schedule
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Today Schedule'),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    '+ Add',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.01),

                            // To see schedules
                            if (viewModel.selectedDate != 22) ...[
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  aspectRatio: 16 / 7,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  onPageChanged: (index, reason) {
                                    viewModel.updateIndex = index;
                                  },
                                ),
                                items: [1, 2, 3].map((item) {
                                  return Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF4D6EA),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(21.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Scene 12B Shoot',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: height * 0.01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.timer_outlined,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                  SizedBox(width: width * 0.01),
                                                  Text(
                                                    '7:00 AM - 10:00 AM',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                  SizedBox(width: width * 0.01),
                                                  Text(
                                                    'Ramoji film city - Set',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height * 0.01),
                                          Text(
                                            'Notes:',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff454545),
                                            ),
                                          ),
                                          SizedBox(height: height * 0.005),
                                          Text(
                                            'Carry white costume',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff454545),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: height * 0.02),
                              // Center(
                              //   child: AnimatedSmoothIndicator(
                              //     activeIndex: viewModel.activeIndex,
                              //     count: [1,2,3].length,
                              //     effect: const WormEffect(
                              //       dotHeight: 8,
                              //       dotWidth: 8,
                              //       activeDotColor: Color(0xff2B2B2B),
                              //       dotColor: Colors.grey,
                              //       spacing: 6,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                width: width,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: primaryColor700, // <-- Works
                                      width: 1,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'View More',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: primaryColor700,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: primaryColor700,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Recent Updates
                              Text(
                                'Recent Updates',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              ...[1, 2].map((element) {
                                return Container(
                                  width: width,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                              border: Border.all(
                                                color: primaryColor300,
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                21.0,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Project Invitation',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: primaryColor700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Colors
                                                            .grey
                                                            .shade400,
                                                        radius: 30,
                                                        backgroundImage: AssetImage(
                                                          AssetsPath
                                                              .profilePictureImg,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Kabaddi Warriors',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                height * 0.01,
                                                          ),
                                                          Text(
                                                            'Requested By: Sandeep Reddy (Director)  ',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                0xff6D6D6D,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  Text(
                                                    'You’ve been invited to join this project as Cast.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff3D3D3D),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.01,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: OutlinedButton(
                                                          style: OutlinedButton.styleFrom(
                                                            side: BorderSide(
                                                              color: redColor,
                                                              width: 1,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    8,
                                                                  ),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Reject',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      redColor,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    width *
                                                                    0.01,
                                                              ),
                                                              Icon(
                                                                Icons.close,
                                                                color: redColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.05,
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                primaryButtonColor,
                                                            foregroundColor:
                                                                Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    8,
                                                                  ),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Accept',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    width *
                                                                    0.01,
                                                              ),
                                                              Icon(Icons.check),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 80,
                                            child: SvgPicture.asset(
                                              AssetsPath
                                                  .projectInvitationItem1Img,
                                            ),
                                          ),
                                          Positioned(
                                            right: 50,
                                            child: SvgPicture.asset(
                                              AssetsPath
                                                  .projectInvitationItem2Img,
                                            ),
                                          ),
                                          Positioned(
                                            right: 30,
                                            top: 40,
                                            child: SvgPicture.asset(
                                              AssetsPath
                                                  .projectInvitationItem3Img,
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 20,
                                            child: SvgPicture.asset(
                                              AssetsPath
                                                  .projectInvitationItem4Img,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.02),
                                    ],
                                  ),
                                );
                              }),
                              SizedBox(height: height * 0.01),
                            ],
                            // If no schedules yet
                            if (viewModel.selectedDate == 22)
                              Container(
                                height: height * 0.1,
                                width: width,
                                decoration: BoxDecoration(
                                  color: primaryColor200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'No Schedules Today',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: height * 0.02),

                            // Quick Actions
                            Text(
                              'Quick Actions',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                quickActions(
                                  action: "Create Project",
                                  size: size,
                                  type: 'add',
                                ),
                                quickActions(
                                  action: "My Calendar",
                                  size: size,
                                  type: 'calendar',
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                quickActions(
                                  action: "Explore People",
                                  size: size,
                                  type: 'search',
                                ),
                                quickActions(
                                  action: "My Profile",
                                  size: size,
                                  type: 'profile',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
