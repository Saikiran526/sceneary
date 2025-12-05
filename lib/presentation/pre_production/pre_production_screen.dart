import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/pre_production/pre_production_viewmodel.dart';

class PreProductionScreen extends StatelessWidget {
  const PreProductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PreProductionViewmodel(context: context),
      child: Consumer<PreProductionViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0,
              title: Row(
                children: [
                  Text(
                    'Pre-Production',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      AppRouter.instance.push(RoutePaths.editPhaseScreen);
                    },
                    child: SvgPicture.asset(AssetsPath.editMember)),
                  SizedBox(width: 60),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF454545),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      AppRouter.instance.push(RoutePaths.createTaskScreen);
                    },
                    child: Text('+Add Tasks'),
                  ),
                ],
              ),
            ),
            body: Padding(
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
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here..",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF5D5D5D),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 16,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF454545),
                          ),
                          children: [
                            TextSpan(
                              text: "Total Tasks : ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '70',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF454545),
                          ),
                          children: [
                            TextSpan(
                              text: "Completed : ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '30',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF454545),
                          ),
                          children: [
                            TextSpan(
                              text: "Pending: ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '10',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF454545),
                          ),
                          children: [
                            TextSpan(
                              text: "On going : ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '10',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF454545),
                          ),
                          children: [
                            TextSpan(
                              text: "Due : ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '10',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF454545),
                          ),
                          children: [
                            TextSpan(
                              text: "Hold : ",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: '10',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFEFEF),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TabBar(
                              padding: EdgeInsets.zero,
                              indicatorPadding: EdgeInsets.zero,
                              dividerColor: Colors.transparent,
                              indicator: BoxDecoration(
                                color: Color(0xFF454545),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,

                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelStyle: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),

                              tabs: [
                                SizedBox(
                                  width: 78,
                                  height: 36,
                                  child: Center(child: Text("All")),
                                ),
                                SizedBox(
                                  width: 78,
                                  height: 36,
                                  child: Center(child: Text("Completed")),
                                ),
                                SizedBox(
                                  width: 78,
                                  height: 36,
                                  child: Center(child: Text("On-going")),
                                ),
                                SizedBox(
                                  width: 78,
                                  height: 36,
                                  child: Center(child: Text("Pending")),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16),
                          Expanded(
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        width: double.infinity,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFC3C3C3),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Script Discussion",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Row(
                                              children: [
                                                Icon(Icons.access_time, size: 13),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Start Date - 22/11/25",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(width: 16),
                                                Icon(Icons.access_time, size: 13),
                                                SizedBox(width: 4),
                                                Text(
                                                  "End Date - 22/1/26",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16),
                                            RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF454545),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "Status : ",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'on-going',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Column(
                                        children: List.generate(3, (index) {
                                          return Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(vertical: 8),
                                                padding: EdgeInsets.all(12),
                                                width: double.infinity,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFC3C3C3),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Storytelling",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 16),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.access_time,
                                                          size: 13,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          "Start Date - 22/11/25",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        SizedBox(width: 16),
                                                        Icon(
                                                          Icons.access_time,
                                                          size: 13,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          "End Date - 22/1/26",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 16),
                                                    RichText(
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                            0xFF454545,
                                                          ),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: "Status : ",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'on-going',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(child: Text("Completed Tasks Here")),
                                Center(child: Text("On-going Tasks Here")),
                                Center(child: Text("Pending Tasks Here")),
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
          );
        },
      ),
    );
  }
}
