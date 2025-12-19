import 'package:flutter/material.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class AcceptRejectShootingSchedulesScreen extends StatelessWidget {
  const AcceptRejectShootingSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: height*0.01,),
            SizedBox(
              width: width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '“New Shooting Schedule Assigned to You”',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      RichText(
                        text: TextSpan(
                          text: 'Scene assigned to you',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
                          children: [
                            TextSpan(
                              text: '- Doctor character',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ]
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      RichText(
                        text: TextSpan(
                            text: 'Schedule Date',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            children: [
                              TextSpan(
                                text: '-12 oct 2025',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ]
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      RichText(
                        text: TextSpan(
                            text: 'Location',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            children: [
                              TextSpan(
                                text: '-Ramoji film city',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ]
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      RichText(
                        text: TextSpan(
                            text: 'Scene',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            children: [
                              TextSpan(
                                text: '-14 & 14A',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ]
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      RichText(
                        text: TextSpan(
                            text: 'int/ext',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            children: [
                              TextSpan(
                                text: '-INT',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ]
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      RichText(
                        text: TextSpan(
                            text: 'Time',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            children: [
                              TextSpan(
                                text: '-6:30AM-5:00PM',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ]
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                              child: OutlinedButton(
                                style:OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                  )
                                ),
                                  onPressed: (){
                                  AppRouter.instance.push(RoutePaths.rejectedScreen);
                                  },
                                  child: Text('Reject')
                              )
                          ),
                          SizedBox(width: width*0.03,),
                          Expanded(
                            flex: 1,
                              child: ElevatedButton(
                                style:ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff4F4F4F),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                  )
                                ),
                                  onPressed: (){},
                                  child: Text('Accept')
                              )
                          ),
                        ],
                      )



                    ],
                  ),
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
