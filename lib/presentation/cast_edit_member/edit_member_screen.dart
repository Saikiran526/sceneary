import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/cast_edit_member/edit_member_viewmodel.dart';
import 'package:sceneary/presentation/create_project/utils.dart';

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
              title: Text(
                'Edit Member',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update member profile and contact information',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                   customTextField(hint: 'Jd', controller: viewModel.nameController),
                    Text(
                      'Role',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    customTextField(
                      hint: 'Director',
                      controller: viewModel.roleController,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    customTextField(
                      hint: 'Director@gamil.com',
                      controller: viewModel.emailController,
                    ),
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    customTextField(
                      hint: '+91 753990343',
                      controller: viewModel.phoneController,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        SizedBox(
                          width: 160,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF454545),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Save Changes',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
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
}
