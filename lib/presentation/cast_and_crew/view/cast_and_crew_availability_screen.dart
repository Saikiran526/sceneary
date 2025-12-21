import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/cast_and_crew/viewmodel/cast_and_crew_availability_viewmodel.dart';
import 'package:sceneary/presentation/project_details/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CastAndCrewAvailabilityScreen extends StatelessWidget {
  const CastAndCrewAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => CastAndCrewAvailabilityViewmodel(context: context),
      child: Consumer<CastAndCrewAvailabilityViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF090216), Color(0xFF9D306A)],
                  ),
                ),
              ),
              title: const Text(
                'Cast & Crew Availability',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: false,
              actions: [
                GestureDetector(
                  onTap: () => servicePopUpMenu(context),
                  child: Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(AssetsPath.menuImg),
                    ),
                  ),
                ),
              ],
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
                          margin: const EdgeInsets.only(top: 8),
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                          decoration: BoxDecoration(
                            color: Color(0XFFFBF4F9),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0XFFF4D6EA)),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetsPath.men1,
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(width: 14),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'John snow',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Lead Actor',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF888888),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0FDF4),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsPath.timer,
                                      width: 12,
                                      height: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'Available',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF0F8A41),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 8),

                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: BoxDecoration(
                        color: Color(0XFFFBF4F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0XFFF4D6EA)),
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
                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Arya Stark',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Lead Actress',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsPath.timer,
                                      width: 12,
                                      height: 12,
                                      color: const Color(0xFF6D6D6D),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        'Unavailable: 2:00 PM - 6:00 PM',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF6D6D6D),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFEF2F2),
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
                                const SizedBox(width: 4),
                                const Text(
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
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: BoxDecoration(
                        color: Color(0XFFFBF4F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0XFFF4D6EA)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Avatar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AssetsPath.women,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 14),

                          // Name, role, dates
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Arya Stark',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Lead Actress',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                const SizedBox(height: 6),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Center(
                                    child: Row(
                                      children: List.generate(5, (index) {
                                        final dates = [
                                          '12',
                                          '13',
                                          '15',
                                          '18',
                                          '20',
                                          '12',
                                          '13',
                                          '15',
                                          '18',
                                          '20',
                                        ];

                                        return Padding(
                                          padding: EdgeInsets.only(
                                            right: index == dates.length - 1
                                                ? 0
                                                : 10,
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                              7,
                                              2,
                                              7,
                                              2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFEE7E7),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                color: const Color(0x66000000),
                                                width: 0.5,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              dates[index],
                                              style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Status badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0FDF4),
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsPath.timer,
                                  width: 12,
                                  height: 12,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  'Available',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF0F8A41),
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
