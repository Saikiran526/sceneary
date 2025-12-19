import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/project_settings/viewmodel/project_status_viewmodel.dart';

class ProjectStatusScreen extends StatelessWidget {
  const ProjectStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectStatusViewmodel(context: context),
      child: Consumer<ProjectStatusViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project Status',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Critical actions affecting availability.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5D5D5D),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 16,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Put Project On Hold',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Pause project activity without deleting. Crew cannot edit while on hold. You can resume anytime.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5D5D5D),
                              ),
                            ),
                            SizedBox(height: 16),
                            primaryButton(text: 'Put on Hold', onPressed: () {
                              viewModel.projectHoldDailog();
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFCB3737),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8)
                            )
                          ),
                          onPressed: (){}, 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               SvgPicture.asset(AssetsPath.delete),
                               SizedBox(width: 10,),
                               Text('Delete Project',
                                style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),)
                            ],
                          )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
