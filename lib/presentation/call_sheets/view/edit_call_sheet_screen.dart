import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/viewmodel/edit_call_sheet_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_action_btn.dart';

class EditCallSheetScreen extends StatelessWidget {
  const EditCallSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => EditCallSheetViewmodel(context: context),
      child: Consumer<EditCallSheetViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Edit call Sheet",
                style :GoogleFonts.montserrat(
                  fontSize: 14,
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
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "From Date",
                                hintText: "dd-mm-yyyy",
                                isRequired: true,
                                suffixIcon: Icons.calendar_month,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                label: "To Date",
                                hintText: "dd-mm-yyyy",
                                isRequired: true,
                                suffixIcon: Icons.calendar_month,
                              ),
                            ),
                          ],
                        ),

                        CustomTextField(
                          label: "Locations",
                          isRequired: true,
                          hintText: "e.g Stadium or office",
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "Shoot start time",
                                hintText: "Select time",
                                isRequired: true,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                label: "Shooot end time",
                                hintText: "Select time",
                                isRequired: true,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                          ],
                        ),

                        CustomTextField(
                          label: "Actors",
                          isRequired: true,
                          hintText: "Comma separated name",
                        ),
                        CustomTextField(
                          label: "Selected cast",
                          isRequired: true,
                          hintText: "Hero -A rjun Heroine - Das",
                        ),
                        CustomTextField(
                          label: "Equipment List",
                          hintText: "Comma separared names",
                          maxLength: 3,
                        ),
                        CustomTextField(
                          label: "Notes / special instructions",
                          hintText: "Any special instructions or notes..",
                          maxLength: 3,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: viewModel.selectAll,
                              onChanged: (value) {
                                viewModel.toggleSelectAll(value!);
                              },
                              activeColor: Colors.black,
                            ),

                            Flexible(
                              child: Text(
                                "Select all crew members",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  height: 23 / 12,
                                  letterSpacing: 0.01,
                                  color: Color(0xFF252525),
                                ),
                              ),
                            ),
                          ],
                        ),

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
                                onTap: () {},
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
          style:  GoogleFonts.montserrat(
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
