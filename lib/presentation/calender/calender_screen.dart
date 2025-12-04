import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/calender/calender_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalenderViewmodel(context: context),
      child: Consumer<CalenderViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFD9D9D9),
              title: Row(
                children: [
                  const Text(
                    'Calender',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      AppRouter.instance.push(
                        RoutePaths.calenderMonthPlanScreen,
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: viewModel.focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(viewModel.selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      viewModel.updateSelectedDay(selectedDay, focusedDay);
                    },
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                    ),
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(color: Colors.transparent),
                      selectedDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, day, focusedDay) {
                        return Container(
                          width: 26,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                      todayBuilder: (context, day, focusedDay) {
                        return Container(
                          width: 26,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 7, right: 7),
                    width: double.infinity,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(25.94),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => viewModel.changeTab(0),
                          child: Container(
                            width: 173,
                            height: 36,
                            decoration: BoxDecoration(
                              color: viewModel.selectedTab == 0
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25.94),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Your Schedule",
                              style: TextStyle(
                                color: viewModel.selectedTab == 0
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () => viewModel.changeTab(1),
                          child: Container(
                            width: 173,
                            height: 36,
                            decoration: BoxDecoration(
                              color: viewModel.selectedTab == 1
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25.94),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                color: viewModel.selectedTab == 1
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  if (viewModel.selectedTab == 0) ...[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text('06 : 00 AM- 10 :00AM'),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 184,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Color(0xFFC3C3C3),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Scene 12B Shoot',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_time, size: 7),
                                        SizedBox(width: 3),
                                        Text(
                                          '6:00 AM – 10:00 AM',
                                          style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 7,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          'Ramoji Film City – Set ',
                                          style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Notes: \n Carry white costume  ',
                                  style: TextStyle(
                                    fontSize: 7,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text('06 : 00 AM- 10 :00AM'),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 184,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Color(0xFFC3C3C3),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Scene 12B Shoot',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_time, size: 7),
                                        SizedBox(width: 3),
                                        Text(
                                          '6:00 AM – 10:00 AM',
                                          style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 7,
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          'Ramoji Film City – Set ',
                                          style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //SizedBox(height: 8),
                                Text(
                                  'Notes: \n Carry white costume  ',
                                  style: TextStyle(
                                    fontSize: 7,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                   },
                                  child: Container(
                                    width: 166,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .black,  
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Request to Free Me",  
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (viewModel.selectedTab == 1) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Mark Whole Day as Busy',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Switch(
                            value: viewModel.wholeDayBusy,
                            onChanged: (value) {
                              viewModel.submitWholeDayBusy();
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Mark Whole Day as Day off',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Switch(
                            value: viewModel.wholeDayOff,
                            onChanged: (value) {
                              viewModel.submitWholeDayOff();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        viewModel.showBottomSheet();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        height: 62,
                        color: const Color(0xFFD9D9D9),
                        child: Row(
                          children: [
                            const Text(
                              'Customize Your Day Plan',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Add',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '10 : 00 AM-12 PM',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 120),
                              Text(
                                'Busy',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5D5D5D),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Reason : Busy in Personal Work',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5D5D5D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
