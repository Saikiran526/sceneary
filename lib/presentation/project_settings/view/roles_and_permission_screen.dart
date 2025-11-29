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
        builder: (context,viewModel,child){
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Text('Roles & Permissions',
                 style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                 ),),
                 SizedBox(height: 8,),
                  Text('Choose what Editors and Managers can access.',
                 style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5D5D5D)
                 ),),
                  ],
                ),
              )),
          );
        }),);
  }
}