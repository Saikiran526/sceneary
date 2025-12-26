import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/calender/viewmodel/calender_intial_viewmodel.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderIntialScreen extends StatelessWidget {
  const CalenderIntialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => CalenderIntialViewmodel(context: context),
      child: Consumer<CalenderIntialViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF090216), Color(0xFF9D306A)],
                  ),
                ),
              ),
              title: Text(
                "Calendar",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {
                    AppRouter.instance.push(RoutePaths.calenderMonthPlanScreen);
                  },
                ),
                SizedBox(width: 8),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: viewModel.goToPreviousMonth,
                      ),
                      Text(
                        "${_monthName(viewModel.focusedDay.month)}, ${viewModel.focusedDay.year}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: viewModel.goToNextMonth,
                      ),
                    ],
                  ),
                  TableCalendar(
                    headerVisible: false,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: viewModel.focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(viewModel.selectedDay, day),
                    onDaySelected: viewModel.onDaySelected,
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                      todayDecoration: BoxDecoration(color: Colors.transparent),
                      selectedDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(fontWeight: FontWeight.w600),
                      weekendStyle: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        final text = [
                          'S',
                          'M',
                          'T',
                          'W',
                          'T',
                          'F',
                          'S',
                        ][day.weekday % 7];
                        return Center(
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                      defaultBuilder: (context, day, focusedDay) {
                        return _dayCell(
                          day.day.toString(),
                          showGreenDot: _showGreenDot(day),
                          showRedDot: _showRedDot(day),
                        );
                      },
                      selectedBuilder: (context, day, focusedDay) {
                        return _dayCell(
                          day.day.toString(),
                          isSelected: true,
                          showGreenDot: _showGreenDot(day),
                          showRedDot: _showRedDot(day),
                        );
                      },
                      todayBuilder: (context, day, focusedDay) {
                        return _dayCell(
                          day.day.toString(),
                          isSelected: false,
                          showGreenDot: false,
                          showRedDot: false,
                        );
                      },
                    ),
                  ),
                  Divider(),
                  if (viewModel.isGreenDateSelected) ...[
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4EBFA),
                        borderRadius: BorderRadius.circular(25.94),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => viewModel.changeTab(0),
                              child: Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: viewModel.selectedTab == 0
                                      ? secondaryColor600
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => viewModel.changeTab(1),
                              child: Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: viewModel.selectedTab == 1
                                      ? secondaryColor600
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (viewModel.selectedTab == 0) ...[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              '06 : 00 AM - 10 : 00 AM',
                              style: TextStyle(fontSize: 10),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 85,
                                    width: 185,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: primaryColor100,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Scene 12B Shoot',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.access_time,
                                              size: 9,
                                            ),
                                            const SizedBox(width: 3),
                                            const Text(
                                              '6:00 AM – 10:00 AM',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: text800,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 9,
                                            ),
                                            const SizedBox(width: 3),
                                            Expanded(
                                              child: Text(
                                                'Ramoji Film City Set',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Notes:',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Carry white costume',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: -7,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 20,
                                        color: secondaryColor600,
                                      ),
                                      onPressed: () {},
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
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              '06 : 00 AM - 10 : 00 AM',
                              style: TextStyle(fontSize: 10),
                            ),
                            const SizedBox(width: 25),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 85,
                                    width: 185,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: primaryColor100,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Scene 12B Shoot',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.access_time,
                                              size: 9,
                                            ),
                                            const SizedBox(width: 3),
                                            const Text(
                                              '6:00 AM – 10:00 AM',
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: text800,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 9,
                                            ),
                                            const SizedBox(width: 3),
                                            Expanded(
                                              child: Text(
                                                'Ramoji Film City Set',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Notes:',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Carry white costume',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 15,
                                    top: -7,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(
                                        Icons.more_vert,
                                        size: 20,
                                        color: secondaryColor600,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                    if (viewModel.selectedTab == 1) ...[
                      SizedBox(height: 10),
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
                            SwitchTheme(
                              data: SwitchThemeData(
                                trackColor: MaterialStateProperty.all(
                                  lightBlue,
                                ),
                                thumbColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: Switch(
                                value: viewModel.editWholeDayBusy,
                                onChanged: (value) {
                                  viewModel.submitEditWholeDayBusy();
                                },
                              ),
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
                            SwitchTheme(
                              data: SwitchThemeData(
                                trackColor: MaterialStateProperty.all(
                                  lightBlue,
                                ),
                                thumbColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                trackOutlineColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: Switch(
                                value: viewModel.editWholeDayOff,
                                onChanged: (value) {
                                  viewModel.submitEditWholeDayoff();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        viewModel.showBottomSheet();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(21),
                        width: double.infinity,
                        height: 62,
                        color: primaryColor200,
                        child: Row(
                          children: [
                            Text(
                              'Customize Your Day Plan',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Add',
                              style: GoogleFonts.montserrat(
                                color: secondaryColor600,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: secondaryColor600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                      
                    ],
                  ],
                  if (!viewModel.isGreenDateSelected) ...[
                    SizedBox(height: 10),
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
                          SwitchTheme(
                            data: SwitchThemeData(
                              trackColor: MaterialStateProperty.all(lightBlue),
                              thumbColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              trackOutlineColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                            ),
                            child: Switch(
                              value: viewModel.wholeDayBusy,
                              onChanged: (value) {
                                viewModel.submitWholeDayBusy();
                              },
                            ),
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
                          SwitchTheme(
                            data: SwitchThemeData(
                              trackColor: MaterialStateProperty.all(lightBlue),
                              thumbColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              trackOutlineColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                            ),
                            child: Switch(
                              value: viewModel.wholeDayOff,
                              onChanged: (value) {
                                viewModel.submitWholeDayOff();
                              },
                            ),
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
                        padding: const EdgeInsets.all(21),
                        width: double.infinity,
                        height: 62,
                        color: primaryColor200,
                        child: Row(
                          children: [
                            Text(
                              'Customize Your Day Plan',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Add',
                              style: GoogleFonts.montserrat(
                                color: secondaryColor600,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: secondaryColor600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (viewModel.availabilityData != null) ...[
                      Padding(
                        padding: const EdgeInsets.all(21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${viewModel.availabilityData!.fromTime.format(context)} - '
                                    '${viewModel.availabilityData!.toTime.format(context)}',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: black950,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  viewModel.availabilityData!.availability,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: red,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Reason : ${viewModel.availabilityData!.reason}',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF5D5D5D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                    ],
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _showGreenDot(DateTime day) {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final checkDate = DateTime(day.year, day.month, day.day);
    final diff = todayDate.difference(checkDate).inDays;
    return diff == 2 || diff == 4;
  }

  bool _showRedDot(DateTime day) {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final checkDate = DateTime(day.year, day.month, day.day);
    final diff = todayDate.difference(checkDate).inDays;
    return diff == 3;
  }

  Widget _dayCell(
    String day, {
    bool isSelected = false,
    bool showGreenDot = false,
    bool showRedDot = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 26,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: isSelected
                ? Border.all(color: Colors.black, width: 1.2)
                : null,
          ),
          child: Text(day, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: 4),
        if (showRedDot || showGreenDot)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showRedDot) _dot(Colors.red),
              if (showGreenDot) _dot(Colors.green),
            ],
          ),
      ],
    );
  }

  Widget _dot(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
}
