import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/create_project/utils.dart';
import 'package:sceneary/presentation/project_settings/viewmodel/project_information_viewmodel.dart';

class ProjectInformationScreen extends StatelessWidget {
  const ProjectInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProjectInformationViewmodel(context: context),
      child: Consumer<ProjectInformationViewmodel>(
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
                        'Project title',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      customTextField(
                        hint: 'Enter here..',
                        controller: viewModel.projectTitleController,
                      ),
                      Text(
                        'Production Banner',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      customTextField(
                        hint: 'Enter here..',
                        controller: viewModel.productionBannerController,
                      ),
                      Text(
                        'Project Type',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      customTextField(
                        hint: 'Select',
                        controller: viewModel.projectTypeController,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Director',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Producer Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 156,
                              child: customTextField(
                                hint: 'Enter here..',
                                controller: viewModel.directorController,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              width: 156,
                              child: customTextField(
                                hint: 'Enter here..',
                                controller: viewModel.producerNameController,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Start Date',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'End Date',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: customTextField(
                              hint: 'Pick a date',
                              controller: viewModel.startDateController,
                              onTap: () => viewModel.selectStartDate(),
                              suffix: SvgPicture.asset(
                                AssetsPath.projectsuffix,
                                height: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: customTextField(
                              hint: 'Pick a date',
                              controller: viewModel.endDateController,
                              onTap: () => viewModel.selectEndDate(),
                              suffix: SvgPicture.asset(
                                AssetsPath.projectsuffix,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Estimated Budget',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      customTextField(
                        hint: 'e.g.., 20000000',
                        controller: viewModel.estimatedController,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Genre',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Language',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 156,
                              child: customTextField(
                                hint: 'e.g.., drama',
                                controller: viewModel.genereController,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              width: 156,
                              child: customTextField(
                                hint: 'e.g.., Telugu,Hindhi',
                                controller: viewModel.languageController,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Description/ Synopsis',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      customTextField(
                        hint: 'Enter here..',
                        controller: viewModel.discriptionController,
                        maxLines: 3,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Project Poster',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(height: 8),
                      DottedBorder(
                        options: const RoundedRectDottedBorderOptions(
                          dashPattern: [4, 3],
                          strokeWidth: 1,
                          radius: Radius.circular(8),
                          color: Color(0x33000000),
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetsPath.upload,
                                height: 16,
                                width: 16,
                              ),
                               SizedBox(height: 8),
                               Text(
                                "Click to upload",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 8),
                               Text(
                                "PNG, JPG up to 5MB",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF5D5D5D)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                         SizedBox(height: 8),
                      Text(
                        'Project Crew List',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 156,
                              child: customTextField(
                                hint: 'e.g.., drama',
                                controller: viewModel.genereController,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              width: 156,
                              child: customTextField(
                                hint: 'e.g.., Telugu,Hindhi',
                                controller: viewModel.languageController,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xFF5D5D5D),
                              
                            ),
                            child: Center(
                              child: Text('Add',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                              ),),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3D3D3D),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8)
                          )
                        ),
                        onPressed: (){}, 
                        child: Text('Save Project')))
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
