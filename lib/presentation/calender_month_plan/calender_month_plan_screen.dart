import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/calender_month_plan/calender_month_plan_viewmodel.dart';

class CalenderMonthPlanScreen extends StatelessWidget {
  const CalenderMonthPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalenderMonthPlanViewmodel(context: context),
      child: Consumer<CalenderMonthPlanViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFD9D9D9),
              title: Text(
                'Calender',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 14),
                        Row(
                          spacing: 30,
                          children: [
                            GestureDetector(
                              onTap: () {
                                viewModel.selectFromDate();
                              },
                              child: Container(
                                width: 91,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      viewModel.fromDateController.text.isEmpty
                                          ? "Select"
                                          : viewModel.fromDateController.text,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SvgPicture.asset(AssetsPath.datePicker),
                                  ],
                                ),
                              ),
                            ),
                            SvgPicture.asset(AssetsPath.arrowForward),
                            GestureDetector(
                              onTap: () {
                                viewModel.selectToDate();
                              },
                              child: Container(
                                width: 91,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      viewModel.toDateController.text.isEmpty
                                          ? "Select"
                                          : viewModel.toDateController.text,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SvgPicture.asset(AssetsPath.datePicker),
                                  ],
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
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
                        Text('29-11-25 to 30-11-25',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
