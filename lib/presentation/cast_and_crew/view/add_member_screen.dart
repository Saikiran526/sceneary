import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/call_sheets/widgets/custom_dropdown.dart';
import 'package:sceneary/presentation/cast_and_crew/viewmodel/add_member_viewmodel.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddMemberViewmodel(context: context),
      child: Consumer<AddMemberViewmodel>(
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
                'Add Member',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Update member profile and contact information',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 32,
                        backgroundImage: AssetImage(AssetsPath.women),
                      ),
                    ),

                    CustomTextField(label: "Name", hintText: "JD"),
                    CustomTextField(
                      label: "Project Role",
                      hintText: "Director",
                    ),
                    CustomTextField(
                      label: "Character",
                      hintText: "Enter Character here...",
                    ),
                    CustomTextField(
                      label: "Email",
                      hintText: "director@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      label: "Phone",
                      hintText: "+91 9119919191991",
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),

                    CustomDropdownField(
                      label: "Assign Access Level",
                      items: viewModel.selectAssignedLevel,
                      hintText: "Select",
                      onChanged: (String? p1) {},
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AppButton(
                              label: "Cancel",
                              onTap: () {},
                              buttonColor: Colors.white,
                              textColor: Color(0XFF1D55A8),
                              borderColor: Color(0XFF1D55A8),
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: AppButton(
                              label: "Add",
                              onTap: () {},
                              buttonColor: Color(0XFF1D55A8),
                              textColor: Colors.white,
                            ),
                          ),
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
