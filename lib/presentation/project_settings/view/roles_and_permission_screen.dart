import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/project_settings/viewmodel/roles_and_permission_viewmodel.dart';

class RolesAndPermissionScreen extends StatelessWidget {
  const RolesAndPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RolesAndPermissionViewmodel(context: context),
      child: Consumer<RolesAndPermissionViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Roles & Permissions',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Choose what Editors and Managers can access.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5D5D5D),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Feature',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Viewer',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF888888),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Editor',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF888888),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Manager',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF888888),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(viewModel.rows.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Edit Project Details',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Checkbox(
                                    activeColor: Colors.black,
                                    value: viewModel.rows[index].check1,
                                    onChanged: (v) =>
                                        viewModel.toggleCheck1(index, v!),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Checkbox(
                                       activeColor: Colors.black,
                                    value: viewModel.rows[index].check2,
                                    onChanged: (v) =>
                                        viewModel.toggleCheck2(index, v!),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Checkbox(
                                       activeColor: Colors.black,
                                    value: viewModel.rows[index].check3,
                                    onChanged: (v) =>
                                        viewModel.toggleCheck3(index, v!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
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
