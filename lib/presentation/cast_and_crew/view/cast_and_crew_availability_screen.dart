import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/cast_and_crew/viewmodel/cast_and_crew_availability_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';

class CastAndCrewAvailabilityScreen extends StatelessWidget {
  const CastAndCrewAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CastAndCrewAvailabilityViewmodel(context: context),
      child: Consumer(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text(
                    'Cast & Crew Availability',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      AssetsPath.menuImg,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: DateTime.now(),

                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                        CalendarFormat.week: 'Week',
                      },

                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        leftChevronVisible: true,
                        rightChevronVisible: true,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.only(top: 8),
                          width: 328,
                          height: 68,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFEDF1F3),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AssetsPath.men1,
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(width: 14),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    width: 86,
                                    height: 23,
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
                        );
                      }),
                    ),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      width: 328,
                      height: 76,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFEDF1F3), width: 1),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          SizedBox(width: 14),
                           Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Arya starc',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Lead Actress',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsPath.timer,
                                      color: Color(0xFF6D6D6D),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Unavailable: 2:00 PM - 6:00 PM',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF6D6D6D),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                           Container(
                            width: 62,
                            height: 23,
                            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEF2F2),
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
}
