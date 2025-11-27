import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentations/mark_your_availability/mark_your_availability_viewmodel.dart';

class MarkYourAvailabilityScreen extends StatelessWidget {
  const MarkYourAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MarkYourAvailabilityViewmodel(context: context),
      child: Consumer<MarkYourAvailabilityViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFD9D9D9),
              title: const Text(
                'Calender',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const Divider(),
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
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 360,
                  height: 62,
                  color: Color(0xFFD9D9D9),
                  child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Customize Your Day Plan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          '06 : 00 AM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Mark as Busy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Switch(
                        value: viewModel.sixAm,
                        onChanged: (value) {
                          viewModel.submitSixAm();
                        },
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          '07 : 00 AM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Mark as Busy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Switch(
                        value: viewModel.sevenAm,
                        onChanged: (value) {
                          viewModel.submitSevenAm();
                        },
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          '08 : 00 AM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Mark as Busy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Switch(
                        value: viewModel.eightAm,
                        onChanged: (value) {
                          viewModel.submitEightAm();
                        },
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          '09 : 00 AM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Mark as Busy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Switch(
                        value: viewModel.nineAm,
                        onChanged: (value) {
                          viewModel.submitNineAm();
                        },
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          '10 : 00 AM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Mark as Busy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Switch(
                        value: viewModel.tenAm,
                        onChanged: (value) {
                          viewModel.submitTenAm();
                        },
                      ),
                    ],
                  ),
                ),
                Divider(),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
