import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class PreviewScenicOrderTemplateDetailsScreen extends StatelessWidget {
  const PreviewScenicOrderTemplateDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scenic order'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: customDropdown(
                        value: null,
                        hintText: 'Version 1',
                        items: ["Version 1", "Version 2", "Version 3"],
                        onChanged: (value) {}
                    ),
                  ),
                  // SizedBox(width: width*0.03,),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 50,
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
                              'Add Entry',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: height * 0.01,),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AssetsPath.downloadImg),
                            SizedBox(width: width * 0.01),
                            Text(
                              'Download Template',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AssetsPath.upload),
                            SizedBox(width: width * 0.01),
                            Text(
                              'Upload Scenes',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    0: FixedColumnWidth(45),
                    1: FixedColumnWidth(100),
                    2: FixedColumnWidth(100),
                    3: FixedColumnWidth(150),
                    4: FixedColumnWidth(120),
                    5: FixedColumnWidth(120),
                    6: FixedColumnWidth(100),
                    7: FixedColumnWidth(100),
                    8: FixedColumnWidth(100),
                    9: FixedColumnWidth(80),
                    10: FixedColumnWidth(120),
                  },
                  children: [
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        children: [
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Slno")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Scene Number")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Sub Scene")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Description")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Location")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Interior/Exterior")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Actors")),
                          Padding(
                              padding: EdgeInsets.all(8), child: Text("Cast")),
                          Padding(
                              padding: EdgeInsets.all(8), child: Text("Crew")),
                          Padding(
                              padding: EdgeInsets.all(8), child: Text("Time")),
                          Padding(padding: EdgeInsets.all(8),
                              child: Text("Actions")),
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(padding: EdgeInsets.all(8), child: Text('1')),
                          Padding(padding: EdgeInsets.all(8), child: Text('1')),
                          Padding(padding: EdgeInsets.all(8), child: Text("A")),
                          Padding(padding: EdgeInsets.all(8), child: Text("Shooting about")),
                          Padding(padding: EdgeInsets.all(8), child: Text("Hyderabad")),
                          Padding(padding: EdgeInsets.all(8), child: Text("Interior")),
                          Padding(padding: EdgeInsets.all(8), child: Text("Heroine,sister")),
                          Padding(padding: EdgeInsets.all(8), child: Text("Pandu")),
                          Padding(padding: EdgeInsets.all(8), child: Text("camera man")),
                          Padding(padding: EdgeInsets.all(8), child: Text("Evening")),
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
                                    AppRouter.instance.push(RoutePaths.editScenicOrderEntryScreen);
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
                            Padding(padding: EdgeInsets.all(8), child: Text('${index+2}')),
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
      ),
    );
  }
}


// Row(
//   children: [
//     Expanded(
//       flex: 2,
//       child: customDropdown(
//           value: null,
//           hintText: 'Version 1',
//           items: ["Version 1","Version 2","Version 3"],
//           onChanged: (value){}
//       ),
//     ),
//     // SizedBox(width: width*0.03,),
//     Spacer(),
//     Expanded(
//       flex: 2,
//       child: SizedBox(
//         height: 50,
//         child: ElevatedButton(
//           onPressed: (){
//             // AppRouter.instance.push(RoutePaths.scenicOrderTemplateListScreen);
//           },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.black,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               )
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(AssetsPath.addImg),
//               Text(
//                 'Add Entry',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//
//   ],
// ),
// SizedBox(height: height*0.01,),
// Row(
//   children: [
//     SizedBox(
//       height: 50,
//       child: Expanded(
//         child: OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//               side: BorderSide(color: Colors.black, width: 1),
//             ),
//           ),
//           onPressed: () {},
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(AssetsPath.downloadImg),
//               SizedBox(width: width * 0.01),
//               Text(
//                 'Download Template',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//     SizedBox(width: width * 0.02),
//     SizedBox(
//       height: 50,
//       child: Expanded(
//         child: OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//               side: BorderSide(color: Colors.black, width: 1),
//             ),
//           ),
//           onPressed: () {},
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(AssetsPath.upload),
//               SizedBox(width: width * 0.01),
//               Text(
//                 'Upload Scenes',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),