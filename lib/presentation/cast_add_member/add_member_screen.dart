import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/create_project/utils.dart';
import 'package:sceneary/presentation/cast_add_member/add_member_viewmodel.dart';

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
              title: Text(
                'Add Member',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update member profile and contact information',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  customTextField(
                    hint: 'Jd',
                    controller: viewModel.nameController,
                  ),
                  Text(
                    'Role',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  customTextField(
                    hint: 'Director',
                    controller: viewModel.roleController,
                  ),
                  Text(
                    'Character',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  customTextField(
                    hint: 'Enter Character here..',
                    controller: viewModel.characterController,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  customTextField(
                    hint: 'Director@gamil.com',
                    controller: viewModel.emailController,
                  ),
                  Text(
                    'Phone',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  customTextField(
                    hint: '+91 753990343',
                    controller: viewModel.phoneController,
                  ),
                  Text(
                    'Assign Access Level',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 328,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0x33000000),
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(8),
                        value: viewModel.assignLevel,
                        items: viewModel.selectAssignedLevel
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            viewModel.selectedAssignedLevel(value);
                          }
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ),
                    ),
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
          );
          ;
        },
      ),
    );
  }
}
