import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/add_shooting_schedule/viewmodel/add_shooting_schedule_step_two_viewmodel.dart';
import 'package:sceneary/presentation/add_shooting_schedule/viewmodel/add_shooting_schedule_viewmodel.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class AddShootingScheduleStepTwo extends StatelessWidget {
  final AddShootingScheduleViewmodel viewModelSuper;
  final bool isEdit;
  const AddShootingScheduleStepTwo({super.key, required this.viewModelSuper, required this.isEdit});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
        create: (_)=>AddShootingScheduleStepTwoViewmodel(),
      child: Consumer<AddShootingScheduleStepTwoViewmodel>(
          builder: (context,viewModel,child){
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AssetsPath.calenderFilledImg,color: Color(0xff454545),height: 18,width: 18,),
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
                                        SizedBox(height: height*0.005,),
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
                                        SizedBox(height: height*0.005,),
                                        Text(
                                          'Scenes 1 - Prabhas Entry,',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(height: height*0.005,),
                                        Text(
                                          'Scenes 2 - Opening Credits,',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(height: height*0.005,),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SvgPicture.asset(AssetsPath.location,color: Color(0xff454545),),
                                    Icon(Icons.location_on,color: Color(0xff454545),size: 18,),
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
                                        SizedBox(height: height*0.005,),
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
                        ),
                        SizedBox(height: height*0.02,),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Color(0xffD1D1D1),
                                  width: 1
                              )
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                    text:TextSpan(
                                        text: "Available members ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black
                                        ),
                                        children:[
                                          TextSpan(
                                            text: "1 / 2 ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.red
                                            ),
                                          ),
                                          TextSpan(
                                            text: "available",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                                SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      inactiveTrackColor: Color(0xffD9D9D9),
                                      activeTrackColor: Color(0xff252525),
                                      trackHeight: 10,
                                      thumbShape: SliderComponentShape.noThumb,
                                      overlayColor: Colors.grey.shade700.withOpacity(0.2),
                                    ),
                                    child: Slider(
                                        value: viewModel.availableMembers,
                                        min: 0,
                                        max: 1,
                                        onChanged: (newValue){}
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        Text(
                          'Cast & Crew Availability',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height*0.01,),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFEDF1F3), width: 1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(AssetsPath.men1, height: 40, width: 40),
                                  SizedBox(width: 14),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'John snow',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Lead Actor',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF888888),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF0FDF4),
                                      borderRadius: BorderRadius.circular(26),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AssetsPath.timer),
                                        SizedBox(width: 4),
                                        Text(
                                          'Available',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF0F8A41),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.01),
                        Container(
                          width: double.infinity,
                          height: 76,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFEDF1F3), width: 1),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  AssetsPath.women,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Arya starc',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'Lead Actress',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF888888),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFEF2F2),
                                            borderRadius: BorderRadius.circular(26),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                AssetsPath.unAvailable,
                                                width: 10,
                                                height: 10,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                'Busy',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFC2060D),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetsPath.timer,
                                          color: Color(0xFF6D6D6D),
                                          width: 10,
                                          height: 10,
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            'Unavailable: 2:00 PM - 6:00 PM',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF6D6D6D),
                                            ),
                                            overflow: TextOverflow.ellipsis,
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

                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: primaryOutlinedButton(
                          text: 'Back',
                          onPressed: (){
                            viewModelSuper.changePage=0;
                          }
                      ),
                    ),
                    SizedBox(width: width*0.03,),
                    Expanded(
                        flex: 1,
                        child: primaryButton(
                            text: 'Add Schedule' ,
                            onPressed: (){
                              if(isEdit==false) {
                                AppRouter.instance.push(RoutePaths.shootingSchedulesPreviewScreen);
                              }
                            }
                        )
                    )
                  ],
                ),
              ],
            );
          }
      ),
    );
  }
}
