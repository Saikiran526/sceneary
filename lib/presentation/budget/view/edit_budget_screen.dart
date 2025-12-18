import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/budget/viewmodel/edit_budget_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_dropdown.dart';

class EditBudgetScreen extends StatelessWidget {
  const EditBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditBudgetViewmodel(context: context),
      child: Consumer<EditBudgetViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Edit Budget",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit budget to maintain flow easily',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0xFF7D7D7D),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomDropdownField(
                            isRequired: true,

                            label: 'Select Phase',
                            hintText: 'Select Phase',
                            value: viewModel.selectedPhase,
                            items: viewModel.phases,
                            onChanged: (String? newValue) {
                              viewModel.setSelectedPhase(newValue);
                            },
                            enabled: true,
                          ),
                          CustomDropdownField(
                            isRequired: true,

                            label: 'Select Department',
                            hintText: 'Select Department',
                            value: viewModel.selectDepartment,
                            items: viewModel.phases,
                            onChanged: (String? newValue) {
                              viewModel.setSelectedPhase(newValue);
                            },
                            enabled: true,
                          ),
                          CustomDropdownField(
                            isRequired: true,

                            label: 'Select Sub-Department',
                            hintText: 'Script Writing',
                            value: viewModel.selectSubDepartment,
                            items: viewModel.phases,
                            onChanged: (String? newValue) {
                              viewModel.setSelectedPhase(newValue);
                            },
                            enabled: true,
                          ),
                          CustomDropdownField(
                            isRequired: true,

                            label: 'Select Currency',
                            hintText: 'India (INR)',
                            value: viewModel.selectCurrency,
                            items: viewModel.phases,
                            onChanged: (String? newValue) {
                              viewModel.setSelectedPhase(newValue);
                            },
                            enabled: true,
                          ),
                          CustomDropdownField(
                            isRequired: true,

                            label: 'Select Units',
                            hintText: 'Select Unit',
                            value: viewModel.selectUnitType,
                            items: viewModel.phases,
                            onChanged: (String? newValue) {
                              viewModel.setSelectedPhase(newValue);
                            },
                            enabled: true,
                          ),

                          CustomTextField(
                            label: "Select Rate Per Unit",
                            isRequired: true,
                            hintText: '10,000',
                            keyboardType: TextInputType.name,
                          ),
                          CustomTextField(
                            label: "Expected Budget",
                            isRequired: true,
                            hintText: '80,000',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            label: "Actual Budget",
                            isRequired: true,
                            hintText: '70,000',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            label: "Paid",
                            isRequired: true,
                            hintText: '60,000',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            label: "Due",
                            isRequired: true,
                            hintText: '10,000',
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            label: "Notes",
                            isRequired: true,
                            hintText: 'Enter notes',
                          ),

                          CustomTextField(
                            label: "GL Account",
                            hintText: 'GL Account',
                          ),
                          CustomTextField(
                            label: "GL Description",
                            hintText: 'GL Description',
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AppButton(
                                  label: "Cancel",
                                  onTap: () {},
                                  buttonColor: Colors.white,
                                  borderColor: Colors.blue,
                                  textColor: Colors.blue,
                                  width: 140,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: AppButton(
                                  label: "Save",
                                  onTap: () {},
                                  buttonColor: Colors.blue,
                                  textColor: Colors.white,
                                  width: 140,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
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
