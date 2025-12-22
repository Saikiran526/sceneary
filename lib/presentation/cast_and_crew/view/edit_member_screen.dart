import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';
import 'package:sceneary/presentation/call_sheets/widgets/customField.dart';
import 'package:sceneary/presentation/cast_and_crew/viewmodel/edit_member_viewmodel.dart';

class EditMemberScreen extends StatelessWidget {
  const EditMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditMemberViewmodel(context: context),
      child: Consumer<EditMemberViewmodel>(
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
                'Edit Member',
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
                    CustomTextField(label: "Name", hintText: "js"),
                    CustomTextField(
                      label: "Project Role",
                      hintText: "Director",
                    ),
                    CustomTextField(
                      label: "Email",
                      hintText: "director@gmail.com",
                    ),
                    CustomTextField(label: "Phone", hintText: "+9191919191"),

                    const SizedBox(height: 10),
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
                          SizedBox(width: 20),

                          Expanded(
                            child: AppButton(
                              label: "Save Changes",
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
