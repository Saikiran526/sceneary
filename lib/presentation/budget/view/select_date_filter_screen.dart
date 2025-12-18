import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/budget/viewmodel/select_date_filter_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';

class SelectDateFilterScreen extends StatelessWidget {
  const SelectDateFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectDateFilterViewmodel(context: context),
      child: Consumer<SelectDateFilterViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Select Date",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextField(
                    label: "Start Date",
                    hintText: "start date",
                    controller: viewModel.startDateController,
                    onTap: () {
                      viewModel.pickDateOrTime(
                        controller: viewModel.startDateController,
                        isDate: true,
                      );
                    },
                    suffixIcon: Icons.calendar_month,
                  ),

                  CustomTextField(
                    label: "End Date",
                    hintText: "end date",
                    controller: viewModel.endDateController,
                    onTap: () {
                      viewModel.pickDateOrTime(
                        controller: viewModel.endDateController,
                        isDate: true,
                      );
                    },
                    suffixIcon: Icons.calendar_month,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: "Cancel",
                          buttonColor: Colors.white,
                          borderColor: Color(0XFF1D55A8),
                          textColor: Color(0XFF1D55A8),
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(width: 10),
                      Expanded(
                        child: AppButton(
                          label: "Save",
                          buttonColor: Color(0XFF1D55A8),
                          borderColor: Color(0XFF1D55A8),
                          textColor: Colors.white,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
