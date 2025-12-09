import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/budget/viewmodel/document_detail_form_viewmodel.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';

class DocumentDetailFormScreen extends StatelessWidget {
  const DocumentDetailFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DocumentDetailFormViewmodel(context: context),
      child: Consumer<DocumentDetailFormViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Makeup Rentals",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Rental & Service Providers",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF7D7D7D),
                    ),
                  ),
                ],
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextField(label: "Phase", hintText: "Shooting"),
                    CustomTextField(
                      label: "Department",
                      hintText: "Makeup/Hair",
                    ),
                    CustomTextField(
                      label: "Sub Department",
                      hintText: "Makeup Rentals",
                    ),
                    CustomTextField(
                      label: "Currency",
                      hintText: "Indian Rupees",
                    ),
                    CustomTextField(
                      label: "Amount",
                      hintText: "10,000",
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      label: "Date of Expense",
                      hintText: "8/12/25",
                    ),
                    CustomTextField(label: "Paid By", hintText: "Rajesh Kumar"),
                    CustomTextField(
                      label: "Description",
                      maxLines: 3,
                      hintText: "Paid All Amount Given To me To Make Up Artist",
                    ),
                    CustomTextField(
                      label: "Upload(Optional)",
                      maxLines: 3,
                      enabled: false,
                      onTap: () {},
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
