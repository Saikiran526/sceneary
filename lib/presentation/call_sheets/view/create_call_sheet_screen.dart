import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/viewmodel/create_call_sheet_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_dropdown.dart';

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
                "Create Call Sheet",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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
                            color: Color(0XFF1D55A8),
                            title: 'Basic Details',
                          ),

                          const SizedBox(width: 6),

                          SizedBox(width: width * 0.2, child: _buildLine()),
                          const SizedBox(width: 6),

                          buildStepCircle(
                            number: 2,
                            color: Color(0XFFD1D1D1),
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
                          controller: viewModel.bannerNameController,
                          isRequired: true,
                        ),
                        CustomTextField(
                          label: "Producer",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                          controller: viewModel.producerController,
                        ),
                        CustomTextField(
                          label: "Director",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                          controller: viewModel.directorController,
                        ),
                        CustomTextField(
                          label: "CEO",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                          controller: viewModel.ceoController,
                        ),
                        CustomTextField(
                          label: "Date of shoot",
                          hintText: "dd-mm-yyyy",
                          isRequired: true,
                          suffixIcon: Icons.calendar_month,
                          controller: viewModel.dateController,
                          readOnly: true,
                          onTap: () {
                            viewModel.pickDateOrTime(
                              controller: viewModel.dateController,
                              isDate: true,
                            );
                          },
                        ),
                        CustomTextField(
                          label: "Shooting Call Time",
                          hintText: "Select Time",
                          isRequired: true,
                          controller: viewModel.shootingTimeController,
                          suffixIcon: Icons.access_time_filled,
                          onTap: () {
                            viewModel.pickDateOrTime(
                              controller: viewModel.shootingTimeController,
                              isDate: false,
                            );
                          },
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: "First Meal",
                                hintText: "Select time",
                                controller: viewModel.breakFastController,
                                onTap: () {
                                  viewModel.pickDateOrTime(
                                    controller: viewModel.breakFastController,
                                    isDate: false,
                                  );
                                },
                                isRequired: false,
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                controller: viewModel.lunchTimeController,
                                onTap: () {
                                  viewModel.pickDateOrTime(
                                    controller: viewModel.lunchTimeController,
                                    isDate: false,
                                  );
                                },
                                label: "Second Meal",
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
                                label: "Third Meal",
                                hintText: "Select time",
                                controller: viewModel.dinnerController,
                                suffixIcon: Icons.access_time_filled,
                                onTap: () {
                                  viewModel.pickDateOrTime(
                                    controller: viewModel.dinnerController,
                                    isDate: false,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                label: "Wrap up",
                                hintText: "Select Time",
                                controller: viewModel.wrapUpController,
                                onTap: () {
                                  viewModel.pickDateOrTime(
                                    controller: viewModel.wrapUpController,
                                    isDate: false,
                                  );
                                },
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomTextField(
                                label: "Tea/Coffee",
                                hintText: "Select Time",
                                controller: viewModel.teaCoffeContoller,
                                onTap: () {
                                  viewModel.pickDateOrTime(
                                    controller: viewModel.teaCoffeContoller,
                                    isDate: false,
                                  );
                                },
                                suffixIcon: Icons.access_time_filled,
                              ),
                            ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),

                            Expanded(
                              flex: 1,
                              child: CustomDropdownField(
                                label: "Day",

                                isRequired: true,
                                hintText: "Select Day",
                                value: viewModel.selectedDay,
                                items: viewModel.day,
                                suffixIcon: Icons.keyboard_arrow_down,
                                onChanged: (String? val) {
                                  viewModel.setSelectedDay(val);
                                },
                              ),
                            ),
                          ],
                        ),

                        CustomTextField(
                          label: "Actors",
                          hintText: "Comma-Separated names",
                          isRequired: true,
                          controller: viewModel.actorsController,
                        ),
                        CustomTextField(
                          label: "Select Cast",
                          hintText: "Hero- AlluArjun - Heroine-Das",
                          isRequired: true,
                          controller: viewModel.selectCastController,
                        ),
                        CustomTextField(
                          label: "Scene Description",
                          hintText: "Write about scence",
                          maxLines: 3,
                          controller: viewModel.sceneDescriptionController,
                        ),
                        CustomTextField(
                          label: "Script Page",
                          hintText: "Hero- AlluArjun - Heroine-Das",
                          isRequired: true,
                          controller: viewModel.scriptPageController,
                        ),
                        CustomTextField(
                          label: "Location",
                          hintText: "Hero- AlluArjun - Heroine-Das",
                          isRequired: true,
                          controller: viewModel.locationController,
                        ),
                        CustomTextField(
                          label: "Important Contacts",
                          hintText: "Write about scence",
                          maxLines: 3,
                          controller: viewModel.importantContactsController,
                        ),

                        AppButton(
                          label: "Add new crew member",
                          fullWidth: true,
                          onTap: () {},
                          buttonColor: Color(0XFF1D55A8),
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 10),

                        CustomDropdownField(
                          label: "Select Crew",

                          isRequired: true,
                          hintText: "Select ",
                          value: viewModel.selectedDay,
                          items: viewModel.day,
                          suffixIcon: Icons.keyboard_arrow_down,
                          onChanged: (String? val) {
                            viewModel.setSelectedDay(val);
                          },
                        ),
                        SizedBox(height: 50),

                        Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                label: "Cancel",
                                onTap: () {},
                                buttonColor: Colors.white,
                                borderColor: Color(0XFF1D55A8),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppButton(
                                textColor: Colors.white,
                                label: "Next",
                                onTap: () {
                                  viewModel.onNextPressed();
                                },
                                buttonColor: Color(0XFF1D55A8),
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
          style: GoogleFonts.montserrat(
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
