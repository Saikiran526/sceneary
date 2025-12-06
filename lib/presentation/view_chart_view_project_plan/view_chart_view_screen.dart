import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/view_chart_view_project_plan/view_chart_view_viewmodel.dart';

class ViewChartViewScreen extends StatelessWidget {
  const ViewChartViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewChartViewViewmodel(context: context),
      child: Consumer(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: Text('salar'),
              actions: [
                SvgPicture.asset(AssetsPath.filterProjectPlan),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ],
            ),
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                       Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFC2C2C2),  
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                        ),
                        child: ExpansionTile(
                          collapsedBackgroundColor: Color(0xFFC2C2C2),
                          backgroundColor: Color(0xFFC2C2C2),
                          childrenPadding: EdgeInsets.zero,
                          title: Text(
                            'Script Discussion',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                          ),
                          children: [
                            Table(
                              border: TableBorder.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        'Tasks',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'jan',
                                            style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),  
                                          ),
                                          Text(
                                            'Feb',
                                           style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),
                                          ),
                                          Text(
                                            'Mar',
                                            style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),
                                          ),
                                          
                                          
                                        ],
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                TableRow(
                                     decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Script Discussion',
                                           style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),),
                                          SvgPicture.asset(AssetsPath.editMember)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15,top: 10,bottom: 10),
                                      width: 235,
                                      height: 20,
                                      color: Color(0xFFD9D9D9),
                                      child: Center(child: Text('Completed')),
                                    )
                                  
                                  ],
                                ),
                                TableRow(
                                     decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Location Scounting',
                                           style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),),
                                          SvgPicture.asset(AssetsPath.editMember)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 30,top: 10,bottom: 10),
                                      width: 235,
                                      height: 20,
                                      color: Color(0xFFD9D9D9),
                                      child: Center(child: Text('Completed')),
                                    )
                                  
                                  ],
                                ),
                                TableRow(
                                     decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Location Scounting',
                                           style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),),
                                          SvgPicture.asset(AssetsPath.editMember)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 40,top: 10,bottom: 10),
                                      width: 235,
                                      height: 20,
                                      color: Color(0xFFD9D9D9),
                                      child: Center(child: Text('Completed')),
                                    )
                                  
                                  ],
                                ),
                                TableRow(
                                     decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Location Scounting',
                                           style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10
                                        ),),
                                          SvgPicture.asset(AssetsPath.editMember)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 50,top: 10,bottom: 10),
                                      width: 235,
                                      height: 20,
                                      color: Color(0xFFD9D9D9),
                                      child: Center(child: Text('Completed')),
                                    )
                                  
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
