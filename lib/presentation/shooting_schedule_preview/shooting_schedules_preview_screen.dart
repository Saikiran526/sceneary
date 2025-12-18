import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/project_details/utils.dart';

class ShootingSchedulesPreviewScreen extends StatelessWidget {
  const ShootingSchedulesPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shooting schedule'),
        actions: [
          SizedBox(width: 21),
          IconButton(
            onPressed: () {
              AppRouter.instance.push(RoutePaths.shootingSchedulesNotificationScreen);
            },
            icon: SvgPicture.asset(AssetsPath.notificationImg),
          ),
          GestureDetector(
            onTap: () {
              servicePopUpMenu(context);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 21),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AssetsPath.menuImg),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 21,right: 21,bottom: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.02,),
              SizedBox(
                width: width*0.4,
                child: ElevatedButton(
                  onPressed: () {
                    // AppRouter.instance.push(RoutePaths.scenicOrderTemplateListScreen);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetsPath.addImg),
                      Text(
                        'Add Schedule',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.01,),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1
                              )
                          ),
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AssetsPath.downloadImg),
                            SizedBox(width: width*0.01,),
                            Text(
                              'Download Template',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                  SizedBox(width: width*0.04,),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1
                              )
                          ),
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AssetsPath.upload),
                            SizedBox(width: width*0.01,),
                            Text(
                              'Upload',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const {
                    0: IntrinsicColumnWidth(),
                    1: IntrinsicColumnWidth(),
                    2: IntrinsicColumnWidth(),
                    3: IntrinsicColumnWidth(),
                    4: IntrinsicColumnWidth(),
                    5: IntrinsicColumnWidth(),
                    6: IntrinsicColumnWidth(),
                    7: IntrinsicColumnWidth(),
                    8: IntrinsicColumnWidth(),
                    9: IntrinsicColumnWidth(),
                    10: IntrinsicColumnWidth(),
                    11: IntrinsicColumnWidth(),
                  },
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        children: [
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("1")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Sl.No *")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("From Date *")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("To Date *")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Scenes *")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Location *")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Interior/Exterior")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Actors")),
                          Padding(
                              padding: EdgeInsets.all(8), child: Text("Selected cast")),
                          Padding(
                              padding: EdgeInsets.all(8), child: Text("From Time")),
                          Padding(
                              padding: EdgeInsets.all(8), child: Text("To Time")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Actions")),
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text('2'))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text('1'))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text('28-11-2025'))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("30-11-2025"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Fight scene"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Hyderabad"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Exterior"))),
                          Padding(padding: EdgeInsets.all(8), child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffBBFFC3),
                              borderRadius: BorderRadius.circular(26)
                            ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Pandu"),
                              )))
                          ),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Hero friend"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("10:00 AM"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("10:00 AM"))),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      )
                                  ),
                                  onPressed: (){
                                    AppRouter.instance.push(RoutePaths.editShootingScheduleScreen);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(width: width*0.01),
                                      Text('Edit')
                                    ],
                                  )
                              )
                          ),
                        ]),
                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text('3'))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text('2'))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text('29-11-2025'))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("30-11-2025"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Fight scene"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Hyderabad"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Exterior"))),
                          Padding(padding: EdgeInsets.all(8), child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFBFBB),
                              borderRadius: BorderRadius.circular(26)
                            ),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                                child: Text("Pandu"),
                              )))
                          ),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("Hero friend"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("10:00 AM"))),
                          Padding(padding: EdgeInsets.all(8), child: Center(child: Text("10:00 AM"))),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      )
                                  ),
                                  onPressed: (){
                                    AppRouter.instance.push(RoutePaths.editShootingScheduleScreen);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(width: width*0.01),
                                      Text('Edit')
                                    ],
                                  )
                              )
                          ),
                        ]),
                    ...List.generate(19, (index){
                      return TableRow(
                          children: [
                            Padding(padding: EdgeInsets.all(8), child: Text('${index+4}')),
                            Padding(padding: EdgeInsets.all(8), child: Text('')),
                            Padding(padding: EdgeInsets.all(8), child: Text('')),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8), child: Text("")),
                            Padding(padding: EdgeInsets.all(8),child: Text("")),
                          ]);
                    }),

                  ],
                ),
              )
        
        
            ],
          ),
        ),
      )
    );
  }
}
