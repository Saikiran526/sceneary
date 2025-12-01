import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';
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
      body: Padding(
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
                SizedBox(
                  height: 50,
                  child: Expanded(
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
                SizedBox(
                  height: 50,
                  child: Expanded(
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    border: TableBorder.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,

                    columnWidths: const {
                      0: FlexColumnWidth(1), // Scene Number
                      1: FlexColumnWidth(1), // Sub scene
                      2: FlexColumnWidth(2), // Description
                      3: FlexColumnWidth(1.5), // Location
                      4: FlexColumnWidth(1.5), // Interior/Exterior
                      5: FlexColumnWidth(1.5), // Actor
                      6: FlexColumnWidth(1.5), // Cast
                      7: FlexColumnWidth(1.5), // Crew
                      8: FlexColumnWidth(1), // Time
                      9: FlexColumnWidth(1.2), // Actions
                    },

                    children: [
                      // ---------------------- HEADER ROW ----------------------
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Scene Number",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Sub scene",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Description",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Location",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Interior/Exterior",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Actor",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Cast",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Crew",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Time",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Actions",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                      // ---------------------- EMPTY ROW FOR DATA ----------------------
                      TableRow(
                        children: List.generate(
                          10,
                              (index) =>
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(""),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


      ],
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