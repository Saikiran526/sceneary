import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/calender/viewmodel/update_your_schedule_viewmodel.dart';

class CalenderMonthPlanScreen extends StatelessWidget {
  const CalenderMonthPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => CalenderMonthPlanViewmodel(context: context),
      child: Consumer<CalenderMonthPlanViewmodel>(
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
                "Update Your Shedule",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select From and to Date',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 30,
                          children: [
                            GestureDetector(
                              onTap: () {
                                viewModel.selectFromDate();
                              },
                              child: SizedBox(
                                width: 100,
                                height: 32,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: secondaryColor600,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          viewModel
                                                  .fromDateController
                                                  .text
                                                  .isEmpty
                                              ? "Select"
                                              : viewModel
                                                    .fromDateController
                                                    .text,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          AssetsPath.datePicker,
                                          width: 14,
                                          height: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SvgPicture.asset(AssetsPath.arrowForward),
                            GestureDetector(
                              onTap: () {
                                viewModel.selectToDate();
                              },
                              child: SizedBox(
                                width: 100,
                                height: 32,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: secondaryColor600,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          viewModel
                                                  .toDateController
                                                  .text
                                                  .isEmpty
                                              ? "Select"
                                              : viewModel.toDateController.text,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          AssetsPath.datePicker,
                                          width: 14,
                                          height: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Mark All Days as Busy',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        SwitchTheme(
                          data: SwitchThemeData(
                            trackColor: MaterialStateProperty.all(lightBlue),
                            thumbColor: MaterialStateProperty.all(Colors.white),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Mark All Days as Day off',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        SwitchTheme(
                          data: SwitchThemeData(
                            trackColor: MaterialStateProperty.all(lightBlue),
                            thumbColor: MaterialStateProperty.all(Colors.white),
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
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${viewModel.fromDateController.text} to '
                            '${viewModel.toDateController.text}',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: black950,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '${viewModel.availabilityData!.fromTime.format(context)} - '
                                '${viewModel.availabilityData!.toTime.format(context)}',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: black950,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: width * 0.40),
                              Text(
                                viewModel.availabilityData!.availability,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: red,
                                ),
                              ),
                              SizedBox(width: 15),
                              SizedBox(
                                width: 22,
                                height: 23, 
                                child: Material(
                                  color: secondaryColor600,
                                  borderRadius: BorderRadius.circular(4),
                                  child: IconButton(
                                    padding: EdgeInsets.zero, 
                                    constraints: const BoxConstraints(
                                      minWidth: 22,
                                      minHeight: 22,
                                    ),
                                    icon: const Icon(
                                      Icons.more_vert,
                                      size: 18, 
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                    },
                                  ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
