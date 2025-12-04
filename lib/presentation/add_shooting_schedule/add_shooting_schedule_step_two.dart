import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sceneary/core/constants/assets_path.dart';

class AddShootingScheduleStepTwo extends StatelessWidget {
  const AddShootingScheduleStepTwo({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step 2: Availability check & Booking',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Review team availability for the scheduled shoot',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color:Color(0xff4B4B4B)
                  ),
                ),
                SizedBox(height: height*0.02,),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(
                      width: 1,
                      color: Color(0xffD1D1D1)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.calenderFilledImg,color: Color(0xff454545),),
                            SizedBox(width: width*0.03,),
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  'Friday, November 28,2025',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: height*0.01,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AssetsPath.actionIndicatorImg,height: 18,width: 18,),
                            SizedBox(width: width*0.03,),
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Scenes',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  'Scenes 1 - Prabhas Entry,',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  'Scenes 2 - Opening Credits,',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  'Scenes 3 - Hospital Entrance,',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: height*0.01,),
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.locationPinImg,color: Color(0xff454545),),
                            SizedBox(width: width*0.03,),
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                      text: 'Hyderabad ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black
                                        ),
                                      children: [
                                        TextSpan(
                                           text: '(Interior)',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ]
                                    ),
                                )
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                )




              ],
            ),
          ),
        )
      ],
    );
  }
}
