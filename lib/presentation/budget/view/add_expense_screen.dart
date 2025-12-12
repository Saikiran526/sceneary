import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/budget/viewmodel/add_expense_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_dropdown.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddExpenseViewmodel(context: context),
      child: Consumer<AddExpenseViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Actuals",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Expense to maintain flow easily',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        height: 20 / 12,
                        letterSpacing: 0.01 * 14,
                        color: const Color(0XFF7D7D7D),
                      ),
                      textAlign: TextAlign.left,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomDropdownField(
                            isRequired: true,

                            label: 'Select Phase',
                            hintText: 'Select Unit',
                            value: viewModel.selectUnitType,
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
                            hintText: 'Select Sub-Department',
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

                          CustomTextField(
                            label: "Amount",
                            isRequired: true,
                            hintText: 'Amount',
                          ),
                          CustomTextField(
                            label: "Date of Expense",
                            isRequired: true,
                            hintText: 'Date',
                            suffixIcon: Icons.calendar_month,
                          ),

                          CustomTextField(
                            label: "Paid By",
                            isRequired: true,
                            hintText: 'Name',
                          ),
                          CustomTextField(
                            label: "Description",
                            hintText: 'Enter text',
                            maxLength: 3,
                          ),
                          CustomTextField(
                            label: "Upload(Optional)",
                            enabled: false,
                            maxLines: 3,
                            centerIcon: Icon(
                              Icons.upload_file,
                              size: 40,
                              color: Colors.blue,
                            ),
                            fileName: "script_v2.pdf",
                            onTap: () {
                              print("Upload tapped");
                            },
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
                                  label: "Add",
                                  onTap: () {},
                                  buttonColor: Colors.blue,
                                  textColor: Colors.white,
                                  width: 140,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 50),
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
