import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';
import 'package:sceneary/presentation/budget/viewmodel/add_budget_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_action_btn.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_dropdown.dart';

class AddBudgetScreen extends StatelessWidget {
  const AddBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddBudgetViewmodel(context: context),
      child: Consumer<AddBudgetViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Add Budget",
                style: GoogleFonts.montserrat(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Add budget to maintain flow easily",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF7D7D7D),
                          ),
                        ),
                      ],
                    ),

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
                      label: 'Select Sub Department',
                      hintText: 'Select Sub Department',
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
                      hintText: 'Select Currency',
                      value: viewModel.selectCurrency,
                      items: viewModel.phases,
                      onChanged: (String? newValue) {
                        viewModel.setSelectedPhase(newValue);
                      },
                      enabled: true,
                    ),

                    CustomDropdownField(
                      isRequired: true,

                      label: 'Select Unit Type',
                      hintText: 'Select Unit',
                      value: viewModel.selectUnitType,
                      items: viewModel.phases,
                      onChanged: (String? newValue) {
                        viewModel.setSelectedPhase(newValue);
                      },
                      enabled: true,
                    ),
                    CustomTextField(label: "Rate Per Unit", isRequired: true),
                    CustomTextField(
                      label: "Select no of Units",
                      isRequired: true,
                    ),
                    CustomTextField(
                      label: "Estimated Budget",
                      isRequired: true,
                    ),

                    CustomDropdownField(
                      isRequired: true,

                      label: "Freeze / Unfreeze",
                      hintText: "Select Phase",
                      value: viewModel.selectedPhase,
                      items: viewModel.phases,
                      onChanged: (String? newValue) {
                        viewModel.setSelectedPhase(newValue);
                      },
                      enabled: true,
                    ),

                    SizedBox(height: 50),

                    Row(
                      children: [
                        Expanded(
                          child: CustomActionButton(
                            label: "Cancel",
                            onTap: () {
                              Navigator.pop(context);
                            },
                            isFullWidth: true,
                            backgroundColor: Colors.white,
                            textColor: Color(0XFF1D55A8),
                            borderColor: Color(0XFF1D55A8),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomActionButton(
                            label: "Add",
                            backgroundColor: Color(0XFF1D55A8),
                            textColor: Colors.white,
                            onTap: () {
                              AppRouter.instance.push(
                                RoutePaths.budgetTabScreen,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
