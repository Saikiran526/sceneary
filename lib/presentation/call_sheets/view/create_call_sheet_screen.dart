import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/call_sheets/viewmodel/create_call_sheet_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_action_btn.dart';

class CreateCallSheetScreen extends StatelessWidget {
  const CreateCallSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => CreateCallSheetViewmodel(context: context),
      child: Consumer<CreateCallSheetViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Create Call Sheet",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildStepCircle(
                            number: 1,
                            color: Colors.black,
                            title: 'Basic Details',
                          ),

                          const SizedBox(width: 6),

                          SizedBox(width: width * 0.2, child: _buildLine()),
                          const SizedBox(width: 6),

                          buildStepCircle(
                            number: 2,
                            color: Color(0xFF868686),
                            title: 'Check Availability',
                          ),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        CustomTextField(
                          label: "Banner Name",
                          hintText: "ARKA Productions",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Producer",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Director",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "CEO",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Date of shoot",
                          hintText: "dd-mm-yyyy",
                          isRequired: true,
                          suffixIcon: Icons.calendar_month,
                        ),
                        CustomTextField(
                          label: "Shooting Call Time",
                          hintText: "Select Time",
                          isRequired: true,
                          suffixIcon: Icons.access_time_filled,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "Breakfast Timne",
                                hintText: "Select time",
                                isRequired: true,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                label: "Lunch Time",
                                hintText: "Select Time",
                                isRequired: true,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "Dinner",
                                hintText: "Select time",
                                isRequired: true,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                label: "Wrap up",
                                hintText: "Select Time",
                                isRequired: true,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "Tea/Coffe",
                                hintText: "Select time",
                                isRequired: true,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                label: "Day",
                                hintText: "Select Day",
                                isRequired: true,
                                suffixIcon: Icons.calendar_month,
                              ),
                            ),
                          ],
                        ),

                        CustomTextField(
                          label: "Actors",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Select Cast",
                          hintText: "Hero- AlluArjun - Heroine-Das",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Scene Description",
                          hintText: "Write about scence",
                          maxLines: 3,
                        ),
                        CustomTextField(
                          label: "Script Page",
                          hintText: "Hero- AlluArjun - Heroine-Das",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Location",
                          hintText: "Hero- AlluArjun - Heroine-Das",
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Important Contacts",
                          hintText: "Write about scence",
                          maxLines: 3,
                        ),

                        SizedBox(height: 50),

                        Row(
                          children: [
                            Expanded(
                              child: CustomActionButton(
                                label: "Cancel",
                                onTap: () {},
                                isFullWidth: true,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomActionButton(
                                label: "Next",
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                borderColor: Colors.black,
                                onTap: () {
                                  AppRouter.instance.push(
                                    RoutePaths
                                        .createCallSheetCheckAvailabilityScreen,
                                  );
                                },
                                isFullWidth: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
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

  Widget buildStepCircle({
    required int number,
    required Color color,
    required String title,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Text(
            "$number",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 10,
            height: 1.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      height: 2,
      color: Colors.grey.shade400,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
